class Menu < ApplicationRecord
  belongs_to :place
  has_many :items

  serialize :hours, Array
  serialize :category, Array

  validates :place_id, presence: true
end
