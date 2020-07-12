defmodule CharDbWeb.NewUserControllerTest do
  use CharDbWeb.ConnCase

  import Hammox

  describe "GET /new" do
    test "without token", %{conn: conn} do
      conn = get(conn, "/new")
      assert html_response(conn, 200) =~ "<form id=\"new_user\""
    end
  end

  describe "POST /new" do
    test "with valid data", %{conn: conn} do
      UserMock
      |> expect(:create, fn %{
                              "username" => "username",
                              "password" => "password",
                              "confirm_password" => "password"
                            } ->
        :ok
      end)

      conn =
        post(conn, "/new", %{
          "username" => "username",
          "password" => "password",
          "confirm_password" => "password"
        })

      assert html_response(conn, 302)
    end

    test "with invalid passwords", %{conn: conn} do
      conn =
        post(conn, "/new", %{
          "username" => "username",
          "password" => "password",
          "confirm_password" => "not_same_newpassword"
        })

      assert html_response(conn, 404)
    end
  end
end
