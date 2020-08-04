defmodule CharDb.Repo.Migrations.Attributes do
  use Ecto.Migration

  def change do
    create table(:attributes) do
      add :strength, :integer
      add :constitution, :integer
      add :size, :integer
      add :dexterity, :integer
      add :inteligence, :integer
      add :power, :integer
      add :charisma, :integer
    end
  end
end
