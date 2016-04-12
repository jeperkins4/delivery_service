class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :menu, foreign_key: true
      t.string :name
      t.string :description
      t.money :price

      t.timestamps
    end
  end
end
