class AddInventoryToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :inventory, :text
  end
end
