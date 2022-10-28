defmodule Api.Repo.Migrations.AddReferencesUserIdWorkingtimes do
  use Ecto.Migration

  def change do
    alter table(:workingtimes) do
      modify :user_id, references(:users, on_delete: :delete_all)
    end
  end
end