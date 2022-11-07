mix esbuild.install
mix ecto.create
mix ecto.migrate
echo "database $PG_DB created"
exec mix phx.server
