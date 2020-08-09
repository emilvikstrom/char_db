defmodule CharDb.Runequest.Adventurer do
  use Ecto.Schema
  import Ecto.Changeset
  alias CharDb.Repo

  alias CharDb.Runequest.{Runes, Skills}

  schema "adventurers" do
    field(:owner, :id, null: false)
    field(:name, :string, null: false)
    field(:runes, :map, null: false)
    field(:passions, :map, default: %{})
    field(:attributes, :map, null: false)
    field(:skills, :map, default: %{})
    field(:homeland, :string)

    timestamps()
  end

  @type t :: %__MODULE__{}

  def read(id) when is_integer(id) do
    Repo.get_by(__MODULE__, %{id: id})
  end

  def create(%{"name" => name, "homeland" => homeland}) do
    data = %{
      name: name,
      homeland: homeland,
      runes: create_base_runes(),
      skills: create_base_skills(),
      attributes: create_base_attributes()
    }

    cast(%__MODULE__{}, data, [:name, :homeland, :runes, :skills, :attributes])
  end

  def save(%__MODULE__{} = adventurer) do
    adventurer
    |> Repo.insert!()
  end

  defp create_base_attributes do
    %{
      strength: 0,
      constitution: 0,
      size: 0,
      dexterity: 0,
      inteligence: 0,
      power: 0,
      charisma: 0
    }
  end

  defp create_base_runes do
    Runes.get_all()
    |> List.foldl(%{}, fn
      %Runes{name: name, type: "Elemental"}, acc ->
        Map.put(acc, name, 0)

      %Runes{name: name, type: "Power"}, acc ->
        Map.put(acc, name, 50)
    end)
  end

  defp create_base_skills do
    Skills.get_all()
    |> List.foldl(%{}, fn %{name: name, base_chance: base_chance}, acc ->
      Map.put(acc, name, base_chance)
    end)
  end
end
