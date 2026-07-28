defmodule FImageSourcesWeb.PageControllerTest do
  use FImageSourcesWeb.ConnCase

  test "GET / links to all image-source demos", %{conn: conn} do
    document = conn |> get(~p"/") |> html_response(200) |> LazyHTML.from_document()

    assert ["/embedded-local", "/embedded-external", "/direct-image"] =
             document
             |> LazyHTML.query("#image-source-demos a")
             |> LazyHTML.attribute("href")
  end

  test "local generated image route returns a real PNG", %{conn: conn} do
    page_conn = get(conn, ~p"/embedded-local")
    document = page_conn |> html_response(200) |> LazyHTML.from_document()
    image_conn = request_metadata_image(page_conn, document)

    assert response_content_type(image_conn, :png) == "image/png"
    assert <<137, "PNG\r\n", 26, "\n", _rest::binary>> = response(image_conn, 200)
  end

  test "external generated image route publishes a signed generated URL", %{conn: conn} do
    document =
      conn
      |> get(~p"/embedded-external")
      |> html_response(200)
      |> LazyHTML.from_document()

    [url] =
      document
      |> LazyHTML.query(~s(meta[property="og:image"]))
      |> LazyHTML.attribute("content")

    assert URI.decode_query(URI.parse(url).query)["__og_ex"]
  end

  test "direct route points metadata straight at the public image", %{conn: conn} do
    document = conn |> get(~p"/direct-image") |> html_response(200) |> LazyHTML.from_document()

    [url] =
      document
      |> LazyHTML.query(~s(meta[property="og:image"]))
      |> LazyHTML.attribute("content")

    uri = URI.parse(url)
    assert uri.path == "/images/logo.svg"
    assert is_nil(uri.query)
  end

  # Follows the generated image URL through its original controller action.
  defp request_metadata_image(conn, document) do
    [url] =
      document
      |> LazyHTML.query(~s(meta[property="og:image"]))
      |> LazyHTML.attribute("content")

    uri = URI.parse(url)

    conn
    |> recycle()
    |> get(uri.path <> "?" <> uri.query)
  end
end
