defmodule CharDbWeb.AuthenticatePlug do
  import Plug.Conn
  alias Plug.Conn
  def init(default), do: default

  def call(%Conn{cookies: %{"sessionToken" => session_token}} = conn, _params) do
    case token().verify_and_validate(session_token) do
      {:ok, _} ->
        %Conn{conn | assigns: %{is_logged_in: true, token: session_token}}

      _else ->
        conn =
          conn
          |> put_status(401)

        %Conn{conn | assigns: %{is_logged_in: false}}
    end
  end

  def call(conn, _params) do
    %Conn{conn | assigns: %{is_logged_in: false}}
  end

  defp token(), do: Application.get_env(:char_db, :token, CharDb.Token)
end
