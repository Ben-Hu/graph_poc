defmodule GraphPocWeb.Graphql.Resolver do
  @things [
    %{id: 1, name: "thing 1"},
    %{id: 2, name: "thing 2"}
  ]

  def list_things(_parent, _args, _resolution) do
    {:ok, Enum.map(@things, &render/1)}
  end

  defp render(thing) do
    %{
      id: thing.id,
      new_name: thing.name
    }
  end
end
