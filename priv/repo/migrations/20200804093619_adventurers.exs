defmodule CharDb.Repo.Migrations.Adventurers do
  use Ecto.Migration

  def change do
    create table(:adventurers) do
      add :name, :string
      add :runes, :integer
      add :attributes, :integer
      add :skills, :integer
      add :owner, :integer

      timestamps()
    end
  end
end
