# Official Elixir release
FROM elixir:1.9.1
# Create an app directory to store our files in
ADD . /app
# Install the Phoenix (phx) archive
RUN mix local.hex --force \
&& mix local.rebar --force
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force
# Set working directory as app
COPY . .
WORKDIR /app
# Expose port 4000
EXPOSE 4000
# Execute commands mentioned under run.sh file
CMD ["./run.sh"]