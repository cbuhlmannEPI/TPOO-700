[
  import_deps: [:ecto, :phoenix],
  inputs: ["*.{ex,exs}", "priv/*/seeds.exs", "{mix,lib,test}/**/*.{ex,exs}"],
  subdirectories: ["priv/*/migrations"]
]
