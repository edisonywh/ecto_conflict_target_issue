defmodule ConflictTargetIssue.Readers.Reader do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reader" do
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(reader, attrs) do
    reader
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end
end
