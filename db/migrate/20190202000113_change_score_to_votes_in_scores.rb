class ChangeScoreToVotesInScores < ActiveRecord::Migration[5.2]
  def change
    rename_column :scores, :score, :votes
  end
end
