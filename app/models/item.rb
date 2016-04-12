class Item < ApplicationRecord
  belongs_to :menu

  monetize :price
end
