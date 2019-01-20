class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :author
      t.string :category, null: false
      t.text :text
      t.datetime :published_at
      t.references :cagematch, foreign_key: true
      t.references :admin_user, foreign_key: true

      t.timestamps
    end
  end
end
