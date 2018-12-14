defmodule GraphPocWeb.Graphql.ContentTypes do
  use Absinthe.Schema.Notation

  object :thing do
    field :id, :id
    field :new_name, :string
  end
end
