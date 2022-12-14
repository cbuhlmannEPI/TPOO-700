defmodule Api.Repo.Migrations.CreateWorkingtimes do
  use Ecto.Migration

  def change do
    create table(:workingtimes) do
      add :start, :naive_datetime, null: false
      add :end, :naive_datetime, null: false
      add :user_id, :integer, null: false

      timestamps()
    end
    create index(:workingtimes, [:user_id])
  end
end
