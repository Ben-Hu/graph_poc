defmodule GraphPocWeb.ThingController do
  use GraphPocWeb, :controller

  def index(conn, _params) do
    render(conn, "thing.json", %{thing: 123})
  end
end
