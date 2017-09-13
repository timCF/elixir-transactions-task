defmodule Transactions.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :first_name, :string
      add :last_name, :string
      add :age, :integer
      add :email, :string
      # it's nice to have unique_index index what contains some fields like email etc

      timestamps()
    end

  end
end
