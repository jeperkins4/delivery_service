class AddLocationToFranchise < ActiveRecord::Migration[5.0]
  def change
    add_column :franchises, :location, :string
    add_column :franchises, :latitude, :decimal
    add_column :franchises, :longitude, :decimal
  end
end
