class AddTeamIdToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :teamid, :integer
  end
end
