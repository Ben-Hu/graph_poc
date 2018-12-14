defmodule GraphPocWeb.Graphql.Resolver do
  @things [
    %{id: "1", name: "thing 1", ref_id: "a"},
    %{id: "2", name: "thing 2", ref_id: "b"}
  ]

  def list_things(_parent, %{ref_id: ref_id}, _resolution) do
    things = @things |> Enum.map(&render/1)
    things = Enum.find(things, fn thing -> thing.ref_id == ref_id end)
    {:ok, things}
  end

  def find_thing(parent, %{error: _}, %{context: %{user: user}} = resolution) do
    IO.inspect("parent: #{inspect parent}")
    IO.inspect("resolution: #{inspect resolution}")
    IO.inspect("user: #{inspect user}")
    error(nil, nil, nil)
  end

  def find_thing(_parent, %{id: id}, _resolution) do
    things = @things |> Enum.map(&render/1)
    thing = Enum.find(things, fn thing -> thing.id == id end)
    {:ok, thing}
  end

  def error(_parent, _args, _resolution), do: {:error, message: "error message", code: 404}

  defp render(thing) do
    %{
      id: thing.id,
      new_name: thing.name,
      ref_id: thing.ref_id
    }
  end
end
