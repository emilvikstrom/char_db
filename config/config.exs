# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :char_db,
  ecto_repos: [CharDb.Repo]

# Configures the endpoint
config :char_db, CharDbWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ea9rF3mxMfh9Q2Kw8jwH2kKTNGuylRwcI8dg4iBt90XNRWhrZelqZG3P/WshkJNC",
  render_errors: [view: CharDbWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CharDb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
