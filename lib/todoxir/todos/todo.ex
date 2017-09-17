defmodule Todoxir.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias Todoxir.Todos.Todo


  schema "todos" do
    field :complete, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Todo{} = todo, attrs) do
    todo
    |> cast(attrs, [:name, :complete])
    |> validate_required([:name, :complete])
  end
end
