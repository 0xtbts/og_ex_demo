defmodule OgExDemoWeb.WideSvgOgCard do
  @moduledoc """
  Defines the wide vector card used by the SVG demonstration route.
  """

  use OgEx.Card,
    width: 1200,
    height: 630,
    format: :svg

  @doc """
  Builds large-card metadata for the wide SVG demonstration.
  """
  @impl OgEx.Card
  def metadata(assigns) do
    %{
      title: assigns.title,
      description: assigns.description,
      type: "website",
      image_alt: "Wide vector signal card",
      twitter_card: "summary_large_image"
    }
  end

  @doc """
  Returns the content that identifies this generated vector image.
  """
  @impl OgEx.Card
  def version(assigns), do: {assigns.title, assigns.description}

  @doc """
  Renders the wide vector card using HEEx and CSS.
  """
  @impl OgEx.Card
  def render(assigns) do
    ~H"""
    <main class="card">
      <div class="signal signal-one"></div>
      <div class="signal signal-two"></div>

      <section class="copy">
        <p class="label">OGEX / VECTOR SIGNAL</p>
        <h1>{@title}</h1>
        <p class="description">{@description}</p>
      </section>

      <footer>
        <p>HEEX → TAKUMI → SVG</p>
        <p>1200 × 630</p>
      </footer>
    </main>

    <style>
      * {
        box-sizing: border-box;
      }

      .card {
        position: relative;
        width: 100%;
        height: 100%;
        overflow: hidden;
        padding: 66px 72px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        color: #f2faff;
        background: #071a52;
        font-family: "DejaVu Sans", sans-serif;
      }

      .copy, footer {
        position: relative;
        z-index: 2;
      }

      .label {
        margin: 0 0 86px;
        color: #00c2ff;
        font-size: 18px;
        font-weight: 700;
        letter-spacing: 0.2em;
      }

      h1 {
        max-width: 820px;
        margin: 0;
        font-size: 92px;
        line-height: 0.94;
        letter-spacing: -0.045em;
      }

      .description {
        max-width: 720px;
        margin: 24px 0 0;
        color: #bcecff;
        font-size: 27px;
        line-height: 1.3;
      }

      footer {
        display: flex;
        justify-content: space-between;
        font-size: 15px;
        font-weight: 700;
        letter-spacing: 0.1em;
      }

      footer p {
        margin: 0;
      }

      .signal {
        position: absolute;
        transform: rotate(-18deg);
      }

      .signal-one {
        width: 520px;
        height: 96px;
        right: -110px;
        top: 88px;
        background: #00c2ff;
      }

      .signal-two {
        width: 390px;
        height: 96px;
        right: -80px;
        top: 220px;
        background: #ffcb47;
      }
    </style>
    """
  end
end
