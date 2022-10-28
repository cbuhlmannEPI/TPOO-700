defmodule Api.Repo.Migrations.CreateClocks do
  use Ecto.Migration

  def change do
    create table(:clocks) do
      add :time, :naive_datetime, null: false
      add :status, :boolean, default: false, null: false
      add :user_id, :integer, null: false

      timestamps()
    end
    create index(:clocks, [:user_id])
  end
end
