defmodule Transactions.Repo.Migrations.CreateOperations do
  use Ecto.Migration

  def change do
    create table(:operations) do
      # in production, floats are bad to represent money amount, we use integers only
      add :amount, :float
      add :description, :string
      # it's nice to have unique_index index like transaction_uuid (is generated in client side)
      # for example to not duplicate transactions from client in case of some network / other issues
      # what trigger retry of operation from client side

      timestamps()
    end

  end
end
