defmodule Api.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :username, :email, :role]}
  schema "users" do
    field :email, :string
    field :username, :string
    field :role, :string
    has_many :clocks, Api.Clocks.Clock
    has_many :workingtimes, Api.Workingtimes.Workingtime

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email])
    |> unique_constraint(:email)
  end
end