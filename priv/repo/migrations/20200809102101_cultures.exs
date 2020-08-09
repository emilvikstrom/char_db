defmodule CharDb.Repo.Migrations.Cultures do
  use Ecto.Migration

  def change do
    create table("cultures") do
      add :name, :string
      add :stereotype, :string
      add :cults, {:array, :string}, default: []
      add :occupations, {:array, :string}, default: []
      add :description, :string
    end
  end
end
