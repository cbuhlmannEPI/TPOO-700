#!/bin/sh

mix ecto.create
mix deps.get
exec mix phx.server