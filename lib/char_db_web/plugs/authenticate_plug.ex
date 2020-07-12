defmodule CharDbWeb.AuthenticatePlug do
  import Plug.Conn
  alias Plug.Conn
  def init(default), do: default

  def call(%Conn{cookies: %{"sessionToken" => sessionToken}} = conn, _params) do
    if valid_token?(sessionToken) do
      %Conn{conn | assigns: %{is_logged_in: true}}
    else
      conn =
        conn
        |> put_status(401)

      %Conn{conn | assigns: %{is_logged_in: false}}
    end
  end

  def call(conn, _params) do
    %Conn{conn | assigns: %{is_logged_in: false}}
  end

  defp valid_token?(token), do: token().valid?(token)

  defp token(), do: Application.get_env(:char_db, :token, CharDb.Token)
end
