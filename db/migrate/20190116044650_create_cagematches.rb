class CreateCagematches < ActiveRecord::Migration[5.2]
  def change
    create_table :cagematches do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :description

      t.timestamps
    end
  end
end
