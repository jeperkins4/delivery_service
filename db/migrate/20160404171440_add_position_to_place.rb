class AddPositionToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :position, :integer
    add_column :menus, :position, :integer
    add_column :items, :position, :integer
  end
end
