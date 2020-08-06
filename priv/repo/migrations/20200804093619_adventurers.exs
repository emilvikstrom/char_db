defmodule CharDb.Repo.Migrations.Adventurers do
  use Ecto.Migration

  def change do
    create table(:adventurers) do
      add :name, :string
      add :runes, :map
      add :attributes, :map
      add :skills, :map
      add :owner, :integer

      timestamps()
    end
  end
end
