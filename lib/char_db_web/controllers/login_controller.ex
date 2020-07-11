defmodule CharDbWeb.LoginController do
  use CharDbWeb, :controller

  def index(conn, _params) do
    is_logged_in = conn.assigns.is_logged_in

    render(conn, "index.html", logged_in: is_logged_in, message: "")
  end

  def login(conn, %{"username" => username, "password" => password}) do
    if authenticate(username, password) do
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
    else
      render(conn, "index.html", logged_in: false, message: "Invalid credentials")
    end
  end

  defp generate_token(), do: "super-secret-token"
  defp authenticate("username", "password"), do: true
  defp authenticate(_username, _password), do: false
end
