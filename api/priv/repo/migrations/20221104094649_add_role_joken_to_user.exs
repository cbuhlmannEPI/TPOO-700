defmodule Api.Repo.Migrations.AddRoleJokenToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :role, :string
      add :password, :string
    end
  end
end
