defmodule OgExDemoWeb.PageControllerTest do
  use OgExDemoWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")

    document =
      conn
      |> html_response(200)
      |> LazyHTML.from_document()

    assert document
           |> LazyHTML.query("h1")
           |> LazyHTML.text()
           |> String.trim() == "OgEx is working"

    assert [_title] =
             document
             |> LazyHTML.query(~s(meta[property="og:title"]))
             |> LazyHTML.attribute("content")

    assert ["summary_large_image"] =
             document
             |> LazyHTML.query(~s(meta[name="twitter:card"]))
             |> LazyHTML.attribute("content")

    [image_url] =
      document
      |> LazyHTML.query(~s(meta[property="og:image"]))
      |> LazyHTML.attribute("content")

    image_uri = URI.parse(image_url)
    image_path = image_uri.path <> "?" <> image_uri.query

    image_conn =
      conn
      |> recycle()
      |> get(image_path)

    assert response_content_type(image_conn, :png) == "image/png"
    assert <<137, "PNG\r\n", 26, "\n", _rest::binary>> = response(image_conn, 200)
  end

  test "GET /square returns compact Twitter metadata and a square PNG", %{conn: conn} do
    conn = get(conn, ~p"/square")

    document =
      conn
      |> html_response(200)
      |> LazyHTML.from_document()

    assert ["summary"] =
             document
             |> LazyHTML.query(~s(meta[name="twitter:card"]))
             |> LazyHTML.attribute("content")

    assert ["600"] =
             document
             |> LazyHTML.query(~s(meta[property="og:image:width"]))
             |> LazyHTML.attribute("content")

    assert ["600"] =
             document
             |> LazyHTML.query(~s(meta[property="og:image:height"]))
             |> LazyHTML.attribute("content")

    [image_url] =
      document
      |> LazyHTML.query(~s(meta[property="og:image"]))
      |> LazyHTML.attribute("content")

    image_uri = URI.parse(image_url)
    image_path = image_uri.path <> "?" <> image_uri.query

    image =
      conn
      |> recycle()
      |> get(image_path)
      |> response(200)

    assert <<137, "PNG\r\n", 26, "\n", _length::32, "IHDR", 600::32, 600::32, _rest::binary>> =
             image
  end

  test "GET /svg returns a wide vector image", %{conn: conn} do
    page_conn = get(conn, ~p"/svg")
    document = page_conn |> html_response(200) |> LazyHTML.from_document()

    assert ["summary_large_image"] =
             document
             |> LazyHTML.query(~s(meta[name="twitter:card"]))
             |> LazyHTML.attribute("content")

    image_conn = request_generated_image(page_conn, document)

    assert response_content_type(image_conn, :svg) == "image/svg+xml"

    svg = response(image_conn, 200)
    assert svg =~ ~s(<svg xmlns="http://www.w3.org/2000/svg")
    assert svg =~ ~s(width="1200")
    assert svg =~ ~s(height="630")
  end

  test "GET /square-svg returns a square vector summary image", %{conn: conn} do
    page_conn = get(conn, ~p"/square-svg")
    document = page_conn |> html_response(200) |> LazyHTML.from_document()

    assert ["summary"] =
             document
             |> LazyHTML.query(~s(meta[name="twitter:card"]))
             |> LazyHTML.attribute("content")

    image_conn = request_generated_image(page_conn, document)

    assert response_content_type(image_conn, :svg) == "image/svg+xml"

    svg = response(image_conn, 200)
    assert svg =~ ~s(<svg xmlns="http://www.w3.org/2000/svg")
    assert svg =~ ~s(width="600")
    assert svg =~ ~s(height="600")
  end

  # Follows the generated image metadata through the same controller route.
  defp request_generated_image(conn, document) do
    [image_url] =
      document
      |> LazyHTML.query(~s(meta[property="og:image"]))
      |> LazyHTML.attribute("content")

    image_uri = URI.parse(image_url)
    image_path = image_uri.path <> "?" <> image_uri.query

    conn
    |> recycle()
    |> get(image_path)
  end
end
