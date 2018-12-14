defmodule GraphPocWeb.Plugs.AuthPlug do
  @behaviour Plug

  import Plug.Conn

  @intercept false

  def init(opts), do: opts

  def call(conn, _) do
    if @intercept do
      conn |> send_resp(401, "unauthorized")
    else
      conn |> assign(:user, %{email: "benjqh@gmail.com"})
    end
  end
end
