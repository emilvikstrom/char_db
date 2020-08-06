defmodule CharDb.Runequest.Skills do
  use Ecto.Schema
  import Ecto.{Changeset, Query}
  alias CharDb.Repo

  schema "skills" do
    field(:name, :string, null: false)
    field(:category, :string, null: false)
    field(:base_chance, :integer)
    field(:description, :string)
  end

  def create(%{
        "name" => name,
        "base_chance" => base_chance,
        "category" => category,
        "description" => description
      })
      when is_integer(base_chance) do
    data = %{name: name, base_chance: base_chance, category: category, description: description}

    cast(%__MODULE__{}, data, [:name, :base_chance, :category, :description])
    |> Repo.insert()
  end

  # Use magic numbers to simulate attribute dependant skill
  # dex*2 = -1
  # dex*3 = -2
  def create(%{
        "name" => name,
        "base_chance" => base_chance,
        "category" => category,
        "description" => description
      }) do
    data = %{
      name: name,
      base_chance: attribute_dependency_to_integer(base_chance),
      category: category,
      description: description
    }

    cast(%__MODULE__{}, data, [:name, :base_chance, :category, :description])
    |> Repo.insert()
  end

  def create(name, base_chance, category, description) do
    data = %{name: name, base_chance: base_chance, category: category, description: description}

    cast(%__MODULE__{}, data, [:name, :base_chance, :category, :description])
    |> Repo.insert()
  end

  defp attribute_dependency_to_integer(ad) do
    case ad do
      "dex*2" -> -1
      "dex*3" -> -2
      "weapon" -> -3
    end
  end

  def get_all() do
    query = from(__MODULE__)
    Repo.all(query)
  end
end
