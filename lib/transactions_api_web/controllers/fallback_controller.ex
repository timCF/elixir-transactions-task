defmodule TransactionsWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use TransactionsWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(TransactionsWeb.ChangesetView, "error.json", changeset: changeset)
  end

  # it seems this function is not covered in tests
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    # are you sure about :"404"?
    |> render(TransactionsWeb.ErrorView, :"404", [])
  end

  def call(conn, {:error, :no_user_found}) do
    conn
    |> put_status(:not_found)
    |> render(TransactionsWeb.UserErrorView, "no_user_found.json", [])
  end
end
