defmodule Mix.Tasks.PopulateDb do
  ## TODO
  ## EVERYTHING

  alias CharDb.Runequest.Skills

  use Mix.Task
  @dex2 -1
  @skills [{"boat", 5, ""}, {"climb", 40, ""}, {"dodge", @dex2, ""}]

  def run(_) do
    Mix.Task.run("app.start", [])

    Enum.each(@skills, fn {name, base_chance, description} ->
      Skills.create(name, base_chance, description)
    end)
  end
end
