defmodule GraphPocWeb.Plugs.AbsinthePlug do
  @behaviour Plug

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    Absinthe.Plug.put_options(conn, context: %{user: conn.assigns.user})
  end
end
