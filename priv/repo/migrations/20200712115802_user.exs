defmodule CharDb.Repo.Migrations.User do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :password, :string
      add :characters, {:array, :integer}

      timestamps()
    end
  end
end
