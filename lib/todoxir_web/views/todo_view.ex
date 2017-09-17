defmodule TodoxirWeb.TodoView do
  use TodoxirWeb, :view
  alias TodoxirWeb.TodoView

  #def render("index.json", %{todos: todos}) do
  #  %{data: render_many(todos, TodoView, "todo.json")}
  #end

  @doc """
  The render_many/3 function takes 1) the data we want to respond with (todos),
  2) a View, and 3) a string to pattern match on the render/3 function defined on View.

  It will map over each item in todos, and pass the item to the render/3 function
  in View matching the file string.
  """
  def todos_json(todos) do
    Poison.encode! render_many(todos, TodoxirWeb.TodoView, "todo.json")
  end

  def render("show.json", %{todo: todo}) do
    %{data: render_one(todo, TodoView, "todo.json")}
  end

  def render("todo.json", %{todo: todo}) do
    %{id: todo.id,
      name: todo.name,
      complete: todo.complete}
  end
end
