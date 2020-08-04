defmodule CharDb.Runequest.Runes do
  use Ecto.Schema
  import Ecto.Changeset
  alias CharDb.Repo

  schema "runes" do
    field(:element_darkness, :integer, default: 0)
    field(:element_water, :integer, default: 0)
    field(:element_earth, :integer, default: 0)
    field(:element_fire_sky, :integer, default: 0)
    field(:element_air, :integer, default: 0)
    field(:element_moon, :integer, default: 0)
    field(:power_harmony_disorder, :map, default: %{harmony: 50, disorder: 50})
    field(:power_statis_movement, :map, default: %{stasis: 50, movement: 50})
    field(:power_truth_illusion, :map, default: %{truth: 50, illusion: 50})
    field(:power_fertility_death, :map, default: %{fertility: 50, death: 50})
    field(:form_beast, :integer, default: 0)
    field(:form_man, :integer, default: 0)
    field(:form_plant, :integer, default: 0)
    field(:form_dragonewt, :integer, default: 0)
    field(:form_spirit, :integer, default: 0)
    field(:form_chaos, :integer, default: 0)
    field(:condition_mastery, :integer, default: 0)
    field(:condition_magic, :integer, default: 0)
    field(:condition_infinity, :integer, default: 0)
    field(:condition_luck, :integer, default: 0)
    field(:condition_fate, :integer, default: 0)
  end

  def create() do
    data = %{}

    {:ok, %__MODULE__{id: id}} =
      cast(%__MODULE__{}, data, [])
      |> unique_constraint(:owner, name: "adventurer_id_index")
      |> Repo.insert()

    {:ok, id}
  end
end
