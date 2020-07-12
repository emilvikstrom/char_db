defmodule CharDbWeb.LoginController do
  use CharDbWeb, :controller

  def index(conn, _params) do
    is_logged_in = conn.assigns.is_logged_in

    render(conn, "index.html", logged_in: is_logged_in, message: "")
  end

  def login(conn, params) do
    case authenticate(params) do
      {:ok, _session} ->
        html(
          conn,
          """
            <html>
              <body>
                <script>
                  document.cookie = "sessionToken=#{generate_token()};"
                  window.location.replace("/login");
                </script>
              </body>
            </html>
          """
        )

      _else ->
        render(conn, "index.html", logged_in: false, message: "Invalid credentials")
    end
  end

  defp generate_token(), do: "super-secret-token"

  defp authenticate(params) do
    users().read(params)
  end

  defp users, do: Application.get_env(:char_db, :user, CharDb.Users)
end
