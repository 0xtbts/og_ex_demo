defmodule FImageSourcesWeb.ExternalImageOgCard do
  @moduledoc """
  Generated demo card containing an allowlisted external image.
  """

  use OgEx.Card, width: 1200, height: 630, format: :png

  @impl OgEx.Card
  @doc """
  Returns social metadata for the external-image card.
  """
  def metadata(assigns) do
    %{title: assigns.title, description: assigns.description, image_alt: "External image demo"}
  end

  @impl OgEx.Card
  @doc """
  Includes the external URL in the generated card's content identity.
  """
  def version(assigns), do: {assigns.title, assigns.external_image_url}

  @impl OgEx.Card
  @doc """
  Renders HEEx using an ordinary HTTPS image source.
  """
  def render(assigns) do
    ~H"""
    <main class="card">
      <img src={@external_image_url} width="520" height="360" />
      <section>
        <p class="eyebrow">REMOTE RESOURCE</p>
        <h1>{@title}</h1>
        <p>{@description}</p>
      </section>
    </main>
    <style>
      * { box-sizing: border-box; }
      .card {
        width: 100%; height: 100%; padding: 64px; display: flex;
        align-items: center; gap: 58px; color: #ecfeff;
        background: linear-gradient(135deg, #082f49, #164e63);
        font-family: "DejaVu Sans", sans-serif;
      }
      img {
        width: 520px; height: 360px; border-radius: 30px;
        object-fit: cover; box-shadow: 0 24px 70px rgba(0, 0, 0, 0.35);
      }
      section { flex: 1; }
      .eyebrow { color: #67e8f9; font-size: 22px; font-weight: 700; letter-spacing: 0.16em; }
      h1 { margin: 18px 0; font-size: 62px; line-height: 1.02; }
      section > p:last-child { color: #bae6fd; font-size: 27px; line-height: 1.35; }
    </style>
    """
  end
end
