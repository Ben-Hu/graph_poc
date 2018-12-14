defmodule GraphPocWeb.ThingView do
  use GraphPocWeb, :view

  def render("thing.json", %{thing: thing}) do
    %{thing: thing}
  end
end
