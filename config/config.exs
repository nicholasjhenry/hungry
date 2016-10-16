# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hungry,
  ecto_repos: [Hungry.Repo]

# Configures the endpoint
config :hungry, Hungry.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KABxXzl65Ne6WSknGbzn6iZ2L8Q/KX0tm6rUzKiiVNl0jE4EZ6qmPR6as9eb0W0f",
  render_errors: [view: Hungry.ErrorView, accepts: ~w(json)],
  pubsub: [name: Hungry.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure phoenix generators
config :phoenix, :generators,
  binary_id: true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
