# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hospitality_hackathon_backend,
  ecto_repos: [HospitalityHackathonBackend.Repo]

# Configures the endpoint
config :hospitality_hackathon_backend, HospitalityHackathonBackend.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zG7y7flZiXJs0O1uL0A8s+O7mylYvCWWG7mK7B/kv5WdaKMIsiNSeMFBplP8XUAo",
  render_errors: [view: HospitalityHackathonBackend.ErrorView, accepts: ~w(json)],
  pubsub: [name: HospitalityHackathonBackend.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
