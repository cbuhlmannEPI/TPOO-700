# Official Elixir release
FROM elixir:latest
# Create an app directory to store our files in
RUN mkdir /app
COPY . /app
WORKDIR /app

# Apt
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get install -y build-essential
RUN apt-get install -y inotify-tools

# Install the Phoenix (phx) archive
RUN mix local.hex --force \
&& mix local.rebar --force && mix deps.update --all
RUN mix do compile 
# Expose port 4000
EXPOSE 4000
# Execute commands mentioned under run.sh file
CMD bash run.sh