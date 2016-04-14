class AddFranchiseToPlace < ActiveRecord::Migration[5.0]
  def change
    add_reference :places, :franchise, foreign_key: true
  end
end
