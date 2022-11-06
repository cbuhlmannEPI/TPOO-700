# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :api,
  ecto_repos: [Api.Repo]

# Configures the endpoint
config :api, ApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "y2njiomLFWKnvfe5OOG0YvT9CtQPXGp7Y/gkt6VttWVF2mMDq6WZkaTymi02JKNq",
  render_errors: [view: ApiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Api.PubSub,
  live_view: [signing_salt: "Vna1p3jv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

  config :my_app, :phoenix_swagger,
  swagger_files: %{
    "priv/static/swagger.json" => [
      router: ApiWeb.Router,     # phoenix routes will be converted to swagger paths
      endpoint: ApiWeb.Endpoint  # (optional) endpoint config used to set host, port and https schemes.
    ]
  }
  config :phoenix_swagger, json_library: Jason

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
config :sample, Sample.Mailer,
  adapter: Swoosh.Adapters.Sendgrid
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
