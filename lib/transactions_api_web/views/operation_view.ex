defmodule TransactionsWeb.OperationView do
  use TransactionsWeb, :view
  alias TransactionsWeb.OperationView

  def render("index.json", %{user_operations: user_operations, operations_total: operations_total}) do
    %{data:
      %{user: render_one(user_operations, TransactionsWeb.UserView, "user.json"),
        operations: render_many(user_operations.operations, OperationView, "user_operation.json"),
        total: operations_total
      }
    }
  end

  def render("show.json", %{operation: operation}) do
    %{data: render_one(operation, OperationView, "operation.json")}
  end

  # in this example you are working with operation like with map
  # but better to work with operation like with a model
  # and use pattern matching to extract data you want, like
  #
  # def render("operation.json", %{operation: %Transactions.Operations.Operation{
  #   id: id,
  #   amount: amount,
  #   ...
  # }}) do
  # ...
  #
  # it's good to have compile-time checks, very useful for refactoring
  #
  #  operation.some_crap_not_exist
  #  will compile and fail on runtime
  #
  #  %Transactions.Operations.Operation{some_crap_not_exist: some_crap_not_exist}
  #  will not compile
  #
  # it's good practice to avoid foo.bar and foo[:bar] constructions in your code

  def render("operation.json", %{operation: operation}) do
    %{id: operation.id,
      amount: operation.amount,
      description: operation.description,
      date: operation.inserted_at,
      type: render_one(operation.type, TransactionsWeb.TypeView, "type.json"),
      user: render_one(operation.user, TransactionsWeb.UserView, "user.json")
    }
  end

  def render("user_operation.json", %{operation: operation}) do
    %{id: operation.id,
      amount: operation.amount,
      description: operation.description,
      date: operation.inserted_at,
      type: render_one(operation.type, TransactionsWeb.TypeView, "type.json")
    }
  end
end
