defmodule CharDb.Runequest.Attributes do
  use Ecto.Schema
  import Ecto.Changeset
  alias CharDb.Repo

  schema "attributes" do
    field(:strength, :integer, default: 11)
    field(:constitution, :integer, default: 11)
    field(:size, :integer, default: 11)
    field(:dexterity, :integer, default: 11)
    field(:inteligence, :integer, default: 11)
    field(:power, :integer, default: 11)
    field(:charisma, :integer, default: 11)
  end
end
