class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :score
      t.references :team, foreign_key: true
      t.references :fight, foreign_key: true
      t.boolean :winner

      t.timestamps
    end
  end
end
