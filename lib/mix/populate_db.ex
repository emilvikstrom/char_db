defmodule Mix.Tasks.PopulateDb do
  ## TODO
  ## EVERYTHING

  alias CharDb.Runequest.{Runes, Skills}

  use Mix.Task

  def run([filename]) do
    Mix.Task.run("app.start", [])

    {:ok, skills} = get_json(filename)

    Enum.each(skills, fn skill_data ->
      Skills.create(skill_data)
    end)
  end

  def run([]) do
    Mix.Task.run("app.start", [])

    {:ok, skills} = get_json("priv/runequest/skills.json")
    {:ok, runes} = get_json("priv/runequest/runes.json")

    Enum.each(skills, fn skill_data ->
      Skills.create(skill_data)
    end)

    Enum.each(runes, fn rune_data ->
      Runes.create(rune_data)
    end)
  end

  def get_json(filename) do
    with {:ok, body} <- File.read(filename), {:ok, json} <- Jason.decode(body), do: {:ok, json}
  end
end
