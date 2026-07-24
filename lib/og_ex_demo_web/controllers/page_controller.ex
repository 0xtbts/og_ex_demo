defmodule OgExDemoWeb.PageController do
  use OgExDemoWeb, :controller
  use OgEx.Controller

  alias OgExDemoWeb.{HomeOgCard, SquareOgCard}

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
end
