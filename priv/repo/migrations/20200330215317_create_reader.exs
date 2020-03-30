defmodule ConflictTargetIssue.Repo.Migrations.CreateReader do
  use Ecto.Migration

  def change do
    create table(:reader) do
      add :email, :string

      timestamps()
    end

    create unique_index(:reader, "lower(email)", name: :readers_email_index)
  end
end
