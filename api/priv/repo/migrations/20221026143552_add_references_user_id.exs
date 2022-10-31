defmodule Api.Repo.Migrations.AddReferencesUserId do
  use Ecto.Migration

  def change do
    alter table(:clocks) do
      modify :user_id, references(:users, on_delete: :delete_all)
    end
  end
end
