defmodule CharDb.TokenTest do
  use CharDbWeb.ConnCase
  alias CharDb.Token

  test "generate token" do
    {:ok, token, claims} = Token.generate_and_sign()
    assert {:ok, _} = Token.verify(token)
    assert %{"exp" => _, "iss" => _} = claims
  end
end
