defmodule CharDbWeb.CharacterController do
  use CharDbWeb, :controller

  alias CharDb.Runequest.Adventurer

  def creation(conn, _params) do
    assign(conn, :creation, %{phase: :name})
    render(conn, "create.html")
  end

  def create(conn, %{"name" => name, "homeland><option value=" => homeland} = _params) do
    adventurer = Adventurer.create(%{"name" => name, "homeland" => homeland})

    assign(conn, :creation, %{adventurer: adventurer, phase: :runes})
    |> render("create.html")
  end

  def create(conn, _params) do
    conn
    |> html("Missing params")
  end
end
