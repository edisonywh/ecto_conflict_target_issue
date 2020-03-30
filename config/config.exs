# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :conflict_target_issue,
  ecto_repos: [ConflictTargetIssue.Repo]

# Configures the endpoint
config :conflict_target_issue, ConflictTargetIssueWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "n8lePAU+P73/q/tCzQiQp3PmZ5Bh5kcPcPYTt+Qn/EQAMrOj85vIdxlUjWE7OEr+",
  render_errors: [view: ConflictTargetIssueWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ConflictTargetIssue.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "vBCzv1cj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
