defmodule FImageSourcesWeb.PageController do
  use FImageSourcesWeb, :controller
  use OgEx.Controller

  alias FImageSourcesWeb.{ExternalImageOgCard, LocalImageOgCard}

  @external_image_url "https://raw.githubusercontent.com/obasekiosa/og_ex/v0.2.0/artifacts/og_ex-preview.png"

  @doc """
  Renders the image-source demo index without attaching a social image.
  """
  def home(conn, _params) do
    render(conn, :home,
      title: "OgEx image-source demos",
      description: "Three live routes exercise local, external, and direct images.",
      active_demo: nil
    )
  end

  @doc """
  Renders a generated card that embeds a local Phoenix static image.
  """
  def embedded_local(conn, _params) do
    render(conn, :home,
      title: "Embedded local image",
      description: "Takumi receives verified bytes loaded from priv/static.",
      active_demo: :embedded_local,
      og: LocalImageOgCard
    )
  end

  @doc """
  Renders a generated card that embeds an allowlisted HTTPS image.
  """
  def embedded_external(conn, _params) do
    render(conn, :home,
      title: "Embedded external image",
      description: "OgEx validates, downloads, caches, and registers the remote image.",
      active_demo: :embedded_external,
      external_image_url: @external_image_url,
      og: ExternalImageOgCard
    )
  end

  @doc """
  Uses an existing public image directly as the page's social image.
  """
  def direct_image(conn, _params) do
    render(conn, :home,
      title: "Direct existing image",
      description: "The metadata points to Plug.Static; Takumi is not invoked.",
      active_demo: :direct_image,
      og: [
        title: "Direct existing OgEx image",
        description: "This og:image is the existing local logo.svg file.",
        image: "/images/logo.svg",
        image_alt: "Phoenix flame logo"
      ]
    )
  end
end
