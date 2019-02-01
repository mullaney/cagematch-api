class DeleteSeasonStringFromFight < ActiveRecord::Migration[5.2]
  def change
    remove_column :fights, :season, :string
  end
end
