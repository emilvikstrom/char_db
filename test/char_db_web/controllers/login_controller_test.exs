defmodule CharDbWeb.LoginControllerTest do
  use CharDbWeb.ConnCase

  import Hammox

  describe "GET /login" do
    test "without token", %{conn: conn} do
      conn = get(conn, "/login")
      assert html_response(conn, 200) =~ "<form id=\"log_in\""
    end

    test "with token", %{conn: conn} do
      TokenMock
      |> expect(:valid?, fn "super-secret-token" -> true end)

      conn =
        conn
        |> put_req_cookie("sessionToken", "super-secret-token")
        |> get("/login")

      assert html_response(conn, 200) =~ "INLOGGAD!!!"
    end

    test "with invalid token", %{conn: conn} do
      TokenMock
      |> expect(:valid?, fn "super-secret-token" -> false end)

      conn =
        conn
        |> put_req_cookie("sessionToken", "super-secret-token")
        |> get("/login")

      assert html_response(conn, 401)
    end
  end

  describe "POST /login" do
    test "POST /login", %{conn: conn} do
      UserMock
      |> expect(:exists?, fn %{"password" => "password", "username" => "username"} ->
        true
      end)

      conn = post(conn, "/login", %{"username" => "username", "password" => "password"})

      assert html_response(conn, 200)
    end
  end
end
