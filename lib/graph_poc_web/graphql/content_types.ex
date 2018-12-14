defmodule GraphPocWeb.Graphql.ContentTypes do
  use Absinthe.Schema.Notation

  object :thing do
    field :id, :id
    field :name, :string
  end
end
