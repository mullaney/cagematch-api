class AddStatusToScore < ActiveRecord::Migration[5.2]
  def change
    add_column :scores, :status, :string
    remove_column :scores, :winner, :boolean
  end
end
