defmodule CharDb.UsersTest do
  use CharDbWeb.ConnCase
  alias CharDb.Users

  @testuser %{
    "password" => "1234",
    "username" => "test"
  }

  test "Insert user" do
    assert :ok = Users.create(@testuser)
  end

  test "Read" do
    Users.create(@testuser)
    assert %Users{username: "test"} = Users.read(@testuser)
  end
end
