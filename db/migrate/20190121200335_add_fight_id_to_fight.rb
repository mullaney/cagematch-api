class AddFightIdToFight < ActiveRecord::Migration[5.2]
  def change
    add_column :fights, :fightid, :integer
  end
end
