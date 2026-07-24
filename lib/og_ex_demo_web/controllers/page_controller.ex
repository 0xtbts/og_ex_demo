defmodule OgExDemoWeb.PageController do
  use OgExDemoWeb, :controller
  use OgEx.Controller

  alias OgExDemoWeb.{HomeOgCard, SquareOgCard, SquareSvgOgCard, WideSvgOgCard}

  @doc """
  Renders the wide Open Graph card demonstration.
  """
  def home(conn, _params) do
    render(conn, :home,
      title: "OgEx is working",
      description: "Open Graph images generated from HEEx and rendered by Takumi.",
      og: HomeOgCard
    )
  end

  @doc """
  Renders the square Open Graph image with compact Twitter card metadata.
  """
  def square(conn, _params) do
    render(conn, :square,
      title: "Small card, clear signal",
      description: "A square OgEx image paired with Twitter's compact summary card.",
      issue: "02",
      og: SquareOgCard
    )
  end

  @doc """
  Renders the wide vector Open Graph card demonstration.
  """
  def svg(conn, _params) do
    render(conn, :svg,
      title: "Signals stay sharp",
      description: "One HEEx layout, emitted as a real 1200 × 630 vector document.",
      og: WideSvgOgCard
    )
  end

  @doc """
  Renders the square vector Open Graph card demonstration.
  """
  def square_svg(conn, _params) do
    render(conn, :square_svg,
      title: "Vector, pocket sized",
      description: "A compact summary card whose typography and shapes remain editable SVG.",
      og: SquareSvgOgCard
    )
  end
end
