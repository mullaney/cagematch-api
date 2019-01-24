class CreateFights < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.string :tagline
      t.string :location
      t.string :season
      t.text :notes
      t.datetime :start_time
      t.boolean :is_exhibition
      t.references :winner, index: true, foreign_key: { to_table: :teams }, null: true
      t.references :cagematch, foreign_key: true

      t.timestamps
    end
  end
end