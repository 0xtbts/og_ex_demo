defmodule FImageSourcesWeb.LocalImageOgCard do
  @moduledoc """
  Generated demo card containing a local Phoenix static image.
  """

  use OgEx.Card, width: 1200, height: 630, format: :png

  @impl OgEx.Card
  @doc """
  Returns social metadata for the local-image card.
  """
  def metadata(assigns) do
    %{title: assigns.title, description: assigns.description, image_alt: "Local image demo"}
  end

  @impl OgEx.Card
  @doc """
  Returns the stable content identity for the local-image card.
  """
  def version(assigns), do: {assigns.title, assigns.description}

  @impl OgEx.Card
  @doc """
  Renders HEEx whose image source resolves below the app's priv/static root.
  """
  def render(assigns) do
    ~H"""
    <main class="card">
      <section>
        <p class="eyebrow">LOCAL RESOURCE</p>
        <h1>{@title}</h1>
        <p>{@description}</p>
      </section>
      <div class="image-shell">
        <img src="/images/logo.svg" width="284" height="192" />
      </div>
    </main>
    <style>
      * { box-sizing: border-box; }
      .card {
        width: 100%; height: 100%; padding: 72px; display: flex;
        align-items: center; justify-content: space-between; gap: 64px;
        color: #f8fafc; background: #111827; font-family: "DejaVu Sans", sans-serif;
      }
      section { width: 720px; }
      .eyebrow { color: #fb923c; font-size: 24px; font-weight: 700; letter-spacing: 0.18em; }
      h1 { margin: 18px 0; font-size: 72px; line-height: 1.02; }
      section > p:last-child { color: #cbd5e1; font-size: 30px; line-height: 1.35; }
      .image-shell {
        width: 300px; height: 260px; display: flex; align-items: center;
        justify-content: center; border-radius: 40px; background: #fff;
      }
      img { width: 284px; height: 192px; object-fit: contain; }
    </style>
    """
  end
end
