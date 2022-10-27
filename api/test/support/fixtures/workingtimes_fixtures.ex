defmodule Api.WorkingtimesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.Workingtimes` context.
  """

  @doc """
  Generate a workingtime.
  """
  def workingtime_fixture(attrs \\ %{}) do
    {:ok, workingtime} =
      attrs
      |> Enum.into(%{
        end: ~N[2022-10-25 09:04:00],
        start: ~N[2022-10-25 09:04:00]
      })
      |> Api.Workingtimes.create_workingtime()

    workingtime
  end
end
