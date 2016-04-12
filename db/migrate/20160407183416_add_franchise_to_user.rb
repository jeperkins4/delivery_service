class AddFranchiseToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :franchise, foreign_key: true
  end
end
