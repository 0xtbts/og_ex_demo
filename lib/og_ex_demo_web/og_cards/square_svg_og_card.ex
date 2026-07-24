defmodule OgExDemoWeb.SquareSvgOgCard do
  @moduledoc """
  Defines the square vector card used by the compact SVG demonstration route.
  """

  use OgEx.Card,
    width: 600,
    height: 600,
    format: :svg

  @doc """
  Builds compact summary metadata for the square SVG demonstration.
  """
  @impl OgEx.Card
  def metadata(assigns) do
    %{
      title: assigns.title,
      description: assigns.description,
      type: "website",
      image_alt: "Square vector specimen card",
      twitter_card: "summary"
    }
  end

  @doc """
  Returns the content that identifies this generated vector image.
  """
  @impl OgEx.Card
  def version(assigns), do: {assigns.title, assigns.description}

  @doc """
  Renders the square vector card using HEEx and CSS.
  """
  @impl OgEx.Card
  def render(assigns) do
    ~H"""
    <main class="card">
      <section>
        <p class="label">VECTOR SPECIMEN</p>
        <h1>{@title}</h1>
        <p class="description">{@description}</p>
      </section>

      <footer>
        <span class="dot"></span>
        <p>600 × 600 / SUMMARY</p>
      </footer>
    </main>

    <style>
      * {
        box-sizing: border-box;
      }

      .card {
        width: 100%;
        height: 100%;
        padding: 52px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        color: #b7f7d8;
        background: #3c1642;
        font-family: "DejaVu Sans", sans-serif;
      }

      .label {
        margin: 0 0 68px;
        color: #ffd166;
        font-size: 15px;
        font-weight: 700;
        letter-spacing: 0.18em;
      }

      h1 {
        max-width: 490px;
        margin: 0;
        font-family: "DejaVu Serif", serif;
        font-size: 62px;
        line-height: 0.96;
      }

      .description {
        max-width: 460px;
        margin: 26px 0 0;
        color: #e5c8e9;
        font-size: 21px;
        line-height: 1.35;
      }

      footer {
        display: flex;
        align-items: center;
        justify-content: space-between;
        font-size: 14px;
        font-weight: 700;
        letter-spacing: 0.08em;
      }

      footer p {
        margin: 0;
      }

      .dot {
        width: 24px;
        height: 24px;
        border-radius: 999px;
        background: #ffd166;
      }
    </style>
    """
  end
end
