defmodule GraphPocWeb.Router do
  use GraphPocWeb, :router

  alias GraphPocWeb.Plugs.AuthPlug
  alias GraphPocWeb.Plugs.AbsinthePlug

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GraphPocWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api" do
    pipe_through [:api, AuthPlug, AbsinthePlug]

    get "/things", GraphPocWeb.ThingController, :index

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: GraphPocWeb.Graphql.Schema

    forward "/graphql", Absinthe.Plug,
      schema: GraphPocWeb.Graphql.Schema
  end

  # Other scopes may use custom stacks.
  # scope "/api", GraphPocWeb do
  #   pipe_through :api
  # end
end
