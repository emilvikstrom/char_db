defmodule CharDb.Runequest.Adventurer do
  use Ecto.Schema
  import Ecto.Changeset
  alias CharDb.Repo

  alias CharDb.Runequest.Runes

  schema "adventurers" do
    field(:owner, :id, null: false)
    field(:name, :string, null: false)
    field(:runes, :integer, null: false)
    field(:attributes, :integer, null: false)
    field(:skills, {:array, :map}, default: [])

    timestamps()
  end

  @type t :: %__MODULE__{}

  def read(id) when is_integer(id) do
    Repo.get_by(__MODULE__, %{id: id})
  end

  def create(%{"name" => name}) do
    {:ok, runes} = Runes.create()
    {:ok, attributes} = {:ok, 0}
    {:ok, skills} = {:ok, []}

    data = %{name: name, runes: runes, skills: skills, attributes: attributes}

    cast(%__MODULE__{}, data, [:name, :runes, :skills, :attributes])
    |> Repo.insert()
  end
end
