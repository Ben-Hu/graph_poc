defmodule GraphPocWeb.Graphql.Schema do
  use Absinthe.Schema
  import_types GraphPocWeb.Graphql.ContentTypes

  alias GraphPocWeb.Graphql.Resolver

  query do
    @desc "list things"
    field :things, list_of(:thing) do
      resolve &Resolver.list_things/3
    end
  end
end
