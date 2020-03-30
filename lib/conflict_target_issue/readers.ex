defmodule ConflictTargetIssue.Readers do
  @moduledoc """
  The Readers context.
  """

  import Ecto.Query, warn: false
  alias ConflictTargetIssue.Repo

  alias ConflictTargetIssue.Readers.Reader

  def replicate_upsert_behavior(attrs \\ %{}) do
    now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)

    %Reader{}
    |> Reader.changeset(attrs)
    |> Repo.insert(
      on_conflict: [set: [updated_at: now]],
      conflict_target: [:email],
      returning: [:id]
    )
  end
end
