defmodule TodoxirWeb.PageController do
  use TodoxirWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
