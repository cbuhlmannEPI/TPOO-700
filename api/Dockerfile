FROM bitwalker/alpine-elixir-phoenix:latest

# Set exposed ports
EXPOSE 4000
ENV PORT=4000 MIX_ENV=prod

# Cache elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile




CMD ["mix", "phx.server"]