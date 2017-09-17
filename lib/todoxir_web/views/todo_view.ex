defmodule TodoxirWeb.TodoView do
  use TodoxirWeb, :view
  alias TodoxirWeb.TodoView

  #def render("index.json", %{todos: todos}) do
  #  %{data: render_many(todos, TodoView, "todo.json")}
  #end

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
