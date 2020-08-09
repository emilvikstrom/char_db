defmodule CharDb.Runequest.Cultures do
  use Ecto.Schema
  import Ecto.{Changeset, Query}
  alias CharDb.Repo

  schema "cultures" do
    field(:name, :string)
    field(:stereotype, :string)
    field(:cults, {:array, :string}, default: [])
    field(:occupations, {:array, :string}, default: [])
    field(:description, :string)
  end

  def create(%{
        "name" => name,
        "stereotype" => stereotype,
        "cults" => cults,
        "occupations" => occupations,
        "description" => description
      }) do
    data = %{
      name: name,
      stereotype: stereotype,
      cults: cults,
      occupations: occupations,
      description: description
    }

    cast(%__MODULE__{}, data, [:name, :stereotype, :cults, :occupations, :description])
    |> Repo.insert()
  end

  def get_all() do
    query = from(__MODULE__)
    Repo.all(query)
  end
end
