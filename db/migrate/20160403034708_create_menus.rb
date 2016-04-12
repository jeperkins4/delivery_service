class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.references :place, foreign_key: true
      t.string :name
      t.string :description
      t.text :category, default: [], array: true
      t.text :hours, default: [], array: true

      t.timestamps
    end
  end
end
