defmodule TransactionsWeb.Router do
  use TransactionsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TransactionsWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    
    scope "/operations", TransactionsWeb do
      resources "/types", TypeController, only: [:index, :create, :show]
      resources "/operations", OperationController, only: [:index, :create, :show]
    end
  end
end
