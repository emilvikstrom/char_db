defmodule CharDbWeb.AuthenticatePlug do
  def init(default), do: default

  def call(%Plug.Conn{cookies: %{"sessionToken" => sessionToken}} = conn, _params) do
    IO.inspect(conn)
    IO.inspect(sessionToken)

    if valid_token?(sessionToken) do
      %Plug.Conn{conn | assigns: %{is_logged_in: true}}
    else
      %Plug.Conn{conn | assigns: %{is_logged_in: false}}
    end
  end

  def call(conn, _params) do
    IO.inspect(conn)
    %Plug.Conn{conn | assigns: %{is_logged_in: false}}
  end

  defp valid_token?("super-secret-token"), do: true
  defp valid_token?(_sessionToken), do: false
end
