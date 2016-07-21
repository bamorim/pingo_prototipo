# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pingo,
  ecto_repos: [Pingo.Repo]

# Configures the endpoint
config :pingo, Pingo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aoPrkxJWr6Tn7pSVq8TufSY0UJy/MeDtU6H7MqIMugv9P/vBq4uINepY6CCr8IBg",
  render_errors: [view: Pingo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pingo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "Pingo",
  ttl: {30, :days},
  secret_key: "TODO: this is not a secret",
  serializer: Pingo.GuardianSerializer


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
