defmodule RealtimeChatPhx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      RealtimeChatPhx.Repo,
      # Start the Telemetry supervisor
      RealtimeChatPhxWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: RealtimeChatPhx.PubSub},
      # Start the Endpoint (http/https)
      RealtimeChatPhxWeb.Endpoint
      # Start a worker by calling: RealtimeChatPhx.Worker.start_link(arg)
      # {RealtimeChatPhx.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RealtimeChatPhx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RealtimeChatPhxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
