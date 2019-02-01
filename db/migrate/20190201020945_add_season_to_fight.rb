class AddSeasonToFight < ActiveRecord::Migration[5.2]
  def change
    add_reference :fights, :season, index: true
    add_foreign_key :fights, :seasons
  end
end
