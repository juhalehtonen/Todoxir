defmodule TodoxirWeb.TodoView do
  use TodoxirWeb, :view
  alias TodoxirWeb.TodoView

  @moduledoc """
  The view’s job is not only to render HTML templates. Views are about data
  presentation. Given a bag of data, the view’s purpose is to present that in a
  meaningful way given some format, be it HTML, JSON, CSV, or others.

  Many web apps today return JSON to remote clients, and Phoenix views are great
  for JSON rendering. Phoenix uses Poison to encode Maps to JSON, so all we need
  to do in our views is format the data we’d like to respond with as a Map, and
  Phoenix will do the rest.

  It is possible to respond with JSON back directly from the controller and skip
  the View. However, if we think about a controller as having the responsibilities
  of receiving a request and fetching data to be sent back, data manipulation and
  formatting don’t fall under those responsibilities. A view gives us a module
  responsible for formatting and manipulating the data.

  We can have views that are responsible for rendering HTML as well as JSON by
  pattern matching on different file types.
  """

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
    Poison.encode! render_many(todos, TodoView, "todo.json")
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
