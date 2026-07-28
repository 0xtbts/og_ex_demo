defmodule FImageSources.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FImageSourcesWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:f_image_sources, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FImageSources.PubSub},
      # Start a worker by calling: FImageSources.Worker.start_link(arg)
      # {FImageSources.Worker, arg},
      # Start to serve requests, typically the last entry
      FImageSourcesWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FImageSources.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FImageSourcesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
