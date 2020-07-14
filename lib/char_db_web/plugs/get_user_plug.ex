defmodule CharDbWeb.GetUserPlug do
  alias CharDb.{Token, Users}
  import Plug.Conn
  def init(default), do: default

  def call(conn, _params) do
    assigns = conn.assigns

    with %{"uid" => uid} <- Token.verify_and_validate!(assigns.token),
         %Users{} = user <- Users.read(uid) do
      assign(conn, :user, user)
    else
      _reason ->
        conn
        |> put_status(404)
    end
  end
end
