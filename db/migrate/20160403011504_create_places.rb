class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :description
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.decimal :latitude
      t.decimal :longitude
      t.text :hours
      t.string :phone
      t.string :email
      t.string :website
      t.string :factual_key
      t.text :category
      t.string :neighborhood

      t.timestamps
    end
  end
end
