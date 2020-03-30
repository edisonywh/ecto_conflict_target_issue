defmodule ConflictTargetIssue.Repo.Migrations.CreateReader do
  use Ecto.Migration

  def change do
    create table(:readers) do
      add :email, :string

      timestamps()
    end

    create unique_index(:readers, ["lower(email)"], name: :readers_email_index)
  end
end
