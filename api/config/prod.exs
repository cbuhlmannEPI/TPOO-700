import Config

config :api, ApiWeb.Endpoint,
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info

# import_config "prod.secret.exs"
