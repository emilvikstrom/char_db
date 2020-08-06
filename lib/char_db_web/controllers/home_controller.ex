defmodule CharDbWeb.HomeController do
  use CharDbWeb, :controller
  import CharDb.Runequest.Adventurer

  def get(conn, _params) do
    %{user: %CharDb.Users{characters: characters}} = conn.assigns
    characters = get_characters(characters)
    render(conn, "index.html", characters: characters)
  end

  defp get_characters(character_ids) do
    Enum.map(character_ids, fn char_id ->
      CharDb.Runequest.Adventurer.read(char_id)
    end)
  end
end
