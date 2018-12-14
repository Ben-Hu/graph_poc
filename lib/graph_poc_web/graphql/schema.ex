defmodule GraphPocWeb.Graphql.Schema do
  use Absinthe.Schema
  import_types GraphPocWeb.Graphql.ContentTypes

  alias GraphPocWeb.Graphql.Resolver

  query do
    @desc "list things"
    field :things, list_of(:thing) do
      arg :ref_id, non_null(:id)
      resolve &Resolver.list_things/3
    end

    field :thing, :thing do
      arg :id, :id
      arg :error, :string
      resolve &Resolver.find_thing/3
    end
  end
end
