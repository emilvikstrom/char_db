defmodule CharDb.Runequest.Runes.Elemental do
  use Ecto.Schema
  import Ecto.Changeset
  alias CharDb.Repo

  schema "elemental" do
    field(:name, :string)
    field(:characteristic, :string)
    field(:sense, :string)
    field(:skill_category, :string)
    field(:weapons, {:array, :string})
    field(:organs, {:array, :string})
    field(:color, :string)
    field(:metal, :string)
    field(:phylum, :string)
    field(:personality, :string)
    belongs_to :runes, CharDb.Runequest.Runes
  end

  def create(%{
        "name" => name,
        "characteristic" => characteristic,
        "sense" => sense,
        "skill_category" => skill_category,
        "weapons" => weapons,
        "organs" => organs,
        "color" => color,
        "metal" => metal,
        "phylum" => phylum,
        "personality" => personality
      }) do
    data = %{
      name: name,
      characteristic: characteristic,
      sense: sense,
      skill_category: skill_category,
      weapons: weapons,
      organs: organs,
      color: color,
      metal: metal,
      phylum: phylum,
      personality: personality
    }

    {:ok, %__MODULE__{}} =
      cast(%__MODULE__{}, data, [
        :name,
        :characteristic,
        :sense,
        :skill_category,
        :weapons,
        :organs,
        :color,
        :metal,
        :phylum,
        :personality
      ])
      |> Repo.insert()
  end
end
