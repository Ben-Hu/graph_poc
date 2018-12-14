defmodule GraphPocWeb.PageController do
  use GraphPocWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
