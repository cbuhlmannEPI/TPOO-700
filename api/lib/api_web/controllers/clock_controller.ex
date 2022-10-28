defmodule ApiWeb.ClockController do
  use ApiWeb, :controller

  alias Api.Clocks
  alias Api.Clocks.Clock

  action_fallback ApiWeb.FallbackController

  def index(conn, %{"userID" => userID}) do
    clocks = Clocks.list_clocks!(userID)
    render(conn, "index.json", clocks: clocks)
  end

  def create(conn, %{"userID"=>userID, "clock" => clock_params}) do
    with {:ok, %Clock{} = clock} <- Clocks.create_clock(userID, clock_params) do
      render(conn, "show.json", clock: clock)
    end
  end
end
