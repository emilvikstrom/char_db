defmodule CharDb.Runequest.Runes.Power do
  use Ecto.Schema
  import Ecto.Changeset
  alias CharDb.Repo

  schema "power" do
    field(:name, :string)
    field(:opposite, :string)
    belongs_to :runes, CharDb.Runequest.Runes
  end

  def create(%{"name" => name, "opposite" => opposite}) do
    data = %{name: name, opposite: opposite}

    {:ok, %__MODULE__{}} =
      cast(%__MODULE__{}, data, [:name, :opposite])
      |> Repo.insert()
  end
end
