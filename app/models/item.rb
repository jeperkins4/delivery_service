class Item < ApplicationRecord
  belongs_to :menu

  monetize :price_cents
end
