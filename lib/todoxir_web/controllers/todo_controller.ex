defmodule TodoxirWeb.TodoController do
  use TodoxirWeb, :controller

  alias Todoxir.Todos
  alias Todoxir.Todos.Todo

  action_fallback TodoxirWeb.FallbackController

  # HTML Scaffolding
  
  def index(conn, _params) do
    todos = Todos.list_todos()
    render(conn, "index.html", todos: todos)
  end

  def show(conn, %{"id" => id}) do
    todo = Todos.get_todo!(id)
    render(conn, "show.html", todo: todo)
  end

  # JSON Scaffolding

  def create(conn, %{"todo" => todo_params}) do
    with {:ok, %Todo{} = todo} <- Todos.create_todo(todo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", todo_path(conn, :show, todo))
      |> render("show.json", todo: todo)
    end
  end

  def update(conn, %{"id" => id, "todo" => todo_params}) do
    todo = Todos.get_todo!(id)

    with {:ok, %Todo{} = todo} <- Todos.update_todo(todo, todo_params) do
      render(conn, "show.json", todo: todo)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo = Todos.get_todo!(id)
    with {:ok, %Todo{}} <- Todos.delete_todo(todo) do
      send_resp(conn, :no_content, "")
    end
  end
end
