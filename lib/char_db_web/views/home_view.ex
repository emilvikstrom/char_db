defmodule CharDbWeb.HomeView do
  use CharDbWeb, :view

  def format_character(character) do
    IO.inspect(character)
    "<br>OOO"
  end
end
