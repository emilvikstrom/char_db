defmodule CharDb.Repo.Migrations.Runes do
  use Ecto.Migration

  def change do
    create table(:runes) do
      add :name, :string, primary_key: true
      add :type, :string
      add :description, :string
    end

    create table(:elemental) do
      add :name, :string
      add :characteristic, :string
      add :sense, :string
      add :skill_category, :string
      add :weapons, {:array, :string}
      add :organs, {:array, :string}
      add :color, :string
      add :metal, :string
      add :phylum, :string
      add :personality, :string
    end

    create table(:power) do
      add :name, :string
      add :opposite, :string
    end
  end
end
