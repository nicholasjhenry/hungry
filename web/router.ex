defmodule Hungry.Router do
  use Hungry.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Hungry do
    pipe_through :api
  end
end
