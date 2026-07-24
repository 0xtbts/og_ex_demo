defmodule OgExDemoWeb.SquareOgCard do
  @moduledoc """
  Defines a square Open Graph image and compact Twitter summary card.
  """

  use OgEx.Card,
    width: 600,
    height: 600,
    format: :png

  @doc """
  Builds social metadata for the square demonstration.
  """
  @impl OgEx.Card
  def metadata(assigns) do
    %{
      title: assigns.title,
      description: assigns.description,
      type: "website",
      image_alt: "Square pocket dispatch issue #{assigns.issue}",
      twitter_card: "summary"
    }
  end

  @doc """
  Returns the values that invalidate the square image cache.
  """
  @impl OgEx.Card
  def version(assigns) do
    {assigns.issue, assigns.title, assigns.description}
  end

  @doc """
  Renders the square card as ordinary HEEx, HTML, and CSS.
  """
  @impl OgEx.Card
  def render(assigns) do
    ~H"""
    <main class="card">
      <section class="content">
        <p class="series">POCKET DISPATCH</p>
        <h1>{@title}</h1>
        <p class="description">{@description}</p>
      </section>

      <section class="footer">
        <p>OGEX / SQUARE</p>
        <p>600 × 600</p>
      </section>

      <p class="issue">{@issue}</p>
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
        padding: 54px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        color: white;
        background: #1746d1;
        font-family: "DejaVu Sans", sans-serif;
      }

      .content {
        position: relative;
        z-index: 2;
      }

      .series {
        margin: 0 0 42px;
        color: #dce7ff;
        font-size: 16px;
        font-weight: 700;
        letter-spacing: 0.18em;
      }

      h1 {
        max-width: 480px;
        margin: 0;
        font-family: "DejaVu Serif", serif;
        font-size: 60px;
        line-height: 0.98;
      }

      .description {
        max-width: 420px;
        margin: 28px 0 0;
        color: #dce7ff;
        font-size: 22px;
        line-height: 1.35;
      }

      .footer {
        position: relative;
        z-index: 2;
        display: flex;
        justify-content: space-between;
        color: white;
        font-size: 14px;
        font-weight: 700;
        letter-spacing: 0.08em;
      }

      .footer p {
        margin: 0;
      }

      .issue {
        position: absolute;
        right: -18px;
        bottom: -76px;
        z-index: 1;
        margin: 0;
        color: #ff6b4a;
        font-family: "DejaVu Serif", serif;
        font-size: 260px;
        font-weight: 700;
        line-height: 1;
      }
    </style>
    """
  end
end
