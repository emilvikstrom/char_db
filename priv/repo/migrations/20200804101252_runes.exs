defmodule CharDb.Repo.Migrations.Runes do
  use Ecto.Migration

  def change do
    create table(:runes) do
      add :owner, :id
      add :element_darkness, :integer
      add :element_water, :integer
      add :element_earth, :integer
      add :element_fire_sky, :integer
      add :element_air, :integer
      add :element_moon, :integer
      add :power_harmony_disorder, :map
      add :power_statis_movement, :map
      add :power_truth_illusion, :map
      add :power_fertility_death, :map
      add :form_beast, :integer
      add :form_man, :integer
      add :form_plant, :integer
      add :form_dragonewt, :integer
      add :form_spirit, :integer
      add :form_chaos, :integer
      add :condition_mastery, :integer
      add :condition_magic, :integer
      add :condition_infinity, :integer
      add :condition_luck, :integer
      add :condition_fate, :integer
    end
  end
end
