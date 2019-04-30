defmodule MyPhoenixAppWeb.PageController do
  use MyPhoenixAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
