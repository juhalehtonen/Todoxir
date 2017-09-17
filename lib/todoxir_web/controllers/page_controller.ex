defmodule TodoxirWeb.PageController do
  use TodoxirWeb, :controller

  def index(conn, _params) do
    todos = Todoxir.Todos.list_todos()
    render conn, "index.html", todos: todos
  end
end
