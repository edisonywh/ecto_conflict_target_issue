defmodule ConflictTargetIssueWeb.Router do
  use ConflictTargetIssueWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ConflictTargetIssueWeb do
    pipe_through :api
  end
end
