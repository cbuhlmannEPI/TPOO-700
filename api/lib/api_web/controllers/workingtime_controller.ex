defmodule ApiWeb.WorkingtimeController do
  use ApiWeb, :controller

  alias Api.Workingtimes
  alias Api.Workingtimes.Workingtime

  action_fallback ApiWeb.FallbackController

  def index(conn, %{"userID" => userID}) do
    workingtimes = Workingtimes.list_workingtimes!(userID)
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def create(conn, %{"userID"=>userID, "workingtime" => workingtime_params}) do
    with {:ok, %Workingtime{} = workingtime} <- Workingtimes.create_workingtime(userID, workingtime_params) do
      render(conn, "show.json", workingtime: workingtime)
    end
  end

  def show(conn, %{"userID" => userID,"id" => id}) do
    workingtimes = Workingtimes.get_workingtime_for_user!(userID, id)
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = Workingtimes.get_workingtime!(id)

    with {:ok, %Workingtime{} = workingtime} <- Workingtimes.update_workingtime(workingtime, workingtime_params) do
      render(conn, "show.json", workingtime: workingtime)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = Workingtimes.get_workingtime!(id)

    with {:ok, %Workingtime{}} <- Workingtimes.delete_workingtime(workingtime) do
      send_resp(conn, :no_content, "")
    end
  end
end
