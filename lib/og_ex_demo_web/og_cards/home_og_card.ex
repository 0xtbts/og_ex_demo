defmodule OgExDemoWeb.HomeOgCard do
  @moduledoc """
  Defines the metadata and HEEx presentation for the demo home page card.
  """

  use OgEx.Card,
    width: 1200,
    height: 630,
    format: :png

  @impl OgEx.Card
  def metadata(assigns) do
    %{
      title: assigns.title,
      description: assigns.description,
      type: "website",
      image_alt: "Preview for #{assigns.title}",
      twitter_card: "summary_large_image"
    }
  end

  @impl OgEx.Card
  def version(assigns) do
    {assigns.title, assigns.description}
  end

  @impl OgEx.Card
  def render(assigns) do
    ~H"""
    <main class="card">
      <p class="label">OGEX DEMO</p>
      <h1>{@title}</h1>
      <p class="description">{@description}</p>
    </main>

    <style>
      * {
        box-sizing: border-box;
      }

      .card {
        width: 100%;
        height: 100%;
        padding: 72px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        color: white;
        background: linear-gradient(135deg, #0f172a, #312e81);
        font-family: "DejaVu Sans", sans-serif;
      }

      .label {
        margin: 0;
        color: #a5b4fc;
        font-size: 24px;
        font-weight: 700;
        letter-spacing: 0.18em;
      }

      h1 {
        margin: 24px 0;
        font-size: 82px;
        line-height: 1;
      }

      .description {
        max-width: 950px;
        margin: 0;
        color: #cbd5e1;
        font-size: 32px;
        line-height: 1.3;
      }
    </style>
    """
  end
end
