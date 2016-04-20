class AddPrepTimeToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :estimated_prep_time, :integer
    add_column :items, :actual_prep_time, :integer
    add_column :places, :estimated_prep_time, :integer
    add_column :places, :actual_prep_time, :integer
  end
end
