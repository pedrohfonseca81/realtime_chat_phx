# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :realtime_chat_phx,
  ecto_repos: [RealtimeChatPhx.Repo]

# Configures the endpoint
config :realtime_chat_phx, RealtimeChatPhxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DqdLBppn45jB7Ieo8MpJ44rtXdEtlJzidNIzNVyJj1pc+cAd7U4gaMbh1Za29sjK",
  render_errors: [view: RealtimeChatPhxWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RealtimeChatPhx.PubSub,
  live_view: [signing_salt: "fV8r2EB5"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
