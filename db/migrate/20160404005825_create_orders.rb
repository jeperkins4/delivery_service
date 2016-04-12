class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true
      t.string :status
      t.datetime :placed_at
      t.datetime :pickup_at
      t.datetime :delivered_at
      t.string :rating
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :phone
      t.references :driver, foreign_key: true

      t.timestamps
    end
  end
end
