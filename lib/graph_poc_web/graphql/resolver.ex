defmodule GraphPocWeb.Graphql.Resolver do
  @things [
    %{id: 1, name: "thing 1"},
    %{id: 2, name: "thing 2"}
  ]

  def list_things(_parent, _args, _resolution) do
    {:ok, @things}
  end
end
