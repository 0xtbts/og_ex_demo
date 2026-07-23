defmodule OgExDemoWeb.PageController do
  use OgExDemoWeb, :controller
  use OgEx.Controller

  alias OgExDemoWeb.HomeOgCard

  def home(conn, _params) do
    render(conn, :home,
      title: "OgEx is working",
      description: "Open Graph images generated from HEEx and rendered by Takumi.",
      og: HomeOgCard
    )
  end
end
