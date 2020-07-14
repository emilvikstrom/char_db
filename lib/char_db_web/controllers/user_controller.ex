defmodule CharDbWeb.UserController do
  use CharDbWeb, :controller

  def get(conn, _params) do
    render(conn, "user.html", username: conn.assigns.user.username)
  end
end
