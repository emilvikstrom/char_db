defmodule CharDbWeb.NewUserController do
  use CharDbWeb, :controller

  def get(conn, _params) do
    render(conn, "new_user.html")
  end

  def create(
        conn,
        %{
          "username" => _username,
          "password" => password,
          "confirm_password" => password
        } = params
      ) do
    create_user(params)
    conn |> redirect(to: "/login")
  end

  def create(conn, _params) do
    conn
    |> put_status(404)
    |> html("passwords doesn't match")
  end

  defp create_user(params) do
    user().create(params)
  end

  defp user, do: Application.get_env(:char_db, :user, CharDb.Users)
end
