defmodule CharDbWeb.CharacterView do
  use CharDbWeb, :view

  alias CharDb.Runequest.{Cultures, Adventurer, Runes}

  #  def create_adventurer(%Plug.Conn{
  #        assigns: %{creation: %{phase: :runes, adventurer: adventurer}}
  #      }) do
  #    create_runes_form()
  #  end

  def create_adventurer(conn) do
    create_character_form()
  end

  # def create_runes_form() do
  #   all_runes = Runes.get_all()
  #
  #   all_rune_checkboxes =
  #     all_runes
  #     |> Enum.filter(fn
  #       %Runes{type: "Elemental"} -> true
  #       _ -> false
  #     end)
  #     |> Enum.map(fn %Runes{name: name} ->
  #       """
  #       <label for=\"rune_#{name}\">#{name}</label>
  #       <input type=checkbox name=\"rune_#{name}\" id=\"rune_#{name}\" required>
  #       """
  #     end)
  #
  #   {header, footer} = form("character_creation", "POST", "/character/create")
  #
  #   html =
  #     List.flatten([
  #       "Select highest affinity element",
  #       header,
  #       all_rune_checkboxes,
  #       footer
  #     ])
  #
  #   raw(html)
  # end

  def create_character_form do
    ("<form id=\"character_name\" method=\"POST\" action=\"/character/create\">" <>
       "<br>" <>
       name_field() <>
       homeland_field() <>
       "<input type=\"submit\"/>" <>
       "</form>")
    |> raw
  end

  #    {header, footer} = form("character_creation", "POST", "/character/create")
  #
  #    html =
  #      List.flatten([
  #        "Name your adventurer",
  #        header,
  #        name(),
  #        footer
  #      ])
  #
  #    raw(html)
  #  end
  #
  #  defp form(id, method, action) do
  #    header = "<form id=\"#{id}\" method=\"#{method}\" action=\"#{action}\">"
  #
  #    footer = """
  #    <br>
  #    <label for=\"#{id}_submit\">#{name}</label>
  #    <input type=\"submit\" name=\"#{id}_submit\" id=\"#{id}_submit\"/>
  #    </form>
  #    """
  #
  #    {header, footer}
  #  end
  #
  defp name_field() do
    "<label for=\"name\">Name</label>" <>
      "<input type=text name=\"name\" id=\"name\" required>"
  end

  defp homeland_field() do
    head =
      "<label for=\"homeland\">Homeland</label>" <>
        "<select id=\"homeland\" name=\"homeland\>"

    options =
      Cultures.get_all()
      |> List.foldl(head, fn %Cultures{name: name}, acc ->
        acc <> "<option value=\"#{name}\">#{name}</option>"
      end)

    options <>
      "</select>"
  end
end
