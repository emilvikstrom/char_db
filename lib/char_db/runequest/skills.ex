defmodule CharDb.Runequest.Skills do
  use Ecto.Schema
  import Ecto.{Changeset, Query}
  alias CharDb.Repo

  schema "skills" do
    field(:name, :string, null: false)
    field(:base_chance, :integer)
    field(:description, :string)
  end

  def get_all_skills() do
  end

  def create(name, base_chance, description) do
    data = %{name: name, base_chance: base_chance, description: description}

    cast(%__MODULE__{}, data, [:name, :base_chance, :description])
    |> Repo.insert()
  end
end
