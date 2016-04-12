class CreateFranchises < ActiveRecord::Migration[5.0]
  def change
    create_table :franchises do |t|
      t.string :name
      t.string :merchant_key

      t.timestamps
    end
  end
end
