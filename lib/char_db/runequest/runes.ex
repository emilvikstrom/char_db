defmodule CharDb.Runequest.Runes do
  use Ecto.Schema
  import Ecto.{Changeset, Query}
  alias CharDb.Repo
  alias CharDb.Runequest.Runes.{Elemental, Power}

  @primary_key {:name, :string, []}
  schema "runes" do
    field(:type, :string)
    field(:description, :string)
  end

  def create(%{"name" => name, "type" => "Elemental", "description" => description} = rune_data) do
    data = %{name: name, type: "Elemental", description: description}

    _res = Elemental.create(rune_data)

    {:ok, %__MODULE__{}} =
      cast(%__MODULE__{}, data, [:name, :type, :description])
      |> Repo.insert()
  end

  def create(%{"name" => name, "type" => "Power", "description" => description} = rune_data) do
    data = %{name: name, type: "Power", description: description}

    _res = Power.create(rune_data)

    {:ok, %__MODULE__{}} =
      cast(%__MODULE__{}, data, [:name, :type, :description])
      |> Repo.insert()
  end

  def create(%{"name" => name, "type" => type, "description" => description} = _rune_data) do
    data = %{name: name, type: type, description: description}

    {:ok, %__MODULE__{}} =
      cast(%__MODULE__{}, data, [:name, :type, :description])
      |> Repo.insert()
  end

  def get_all() do
    query = from(__MODULE__)
    Repo.all(query)
  end
end
