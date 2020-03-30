defmodule ConflictTargetIssue.Repo do
  use Ecto.Repo,
    otp_app: :conflict_target_issue,
    adapter: Ecto.Adapters.Postgres
end
