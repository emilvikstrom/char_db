defmodule CharDb.Repo.Migrations.Skills do
  use Ecto.Migration

  def change do
    create table("skills") do
      add :name, :string
      add :base_chance, :integer
      add :category, :string
      add :description, :string
    end
  end
end
