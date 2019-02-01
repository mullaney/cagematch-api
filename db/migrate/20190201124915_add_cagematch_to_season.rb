class AddCagematchToSeason < ActiveRecord::Migration[5.2]
  def change
    add_reference :seasons, :cagematch, index: true
    add_foreign_key :seasons, :cagematches
  end
end
