class Order < ApplicationRecord
  belongs_to :user
  belongs_to :place
  belongs_to :driver
end
