class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  
  has_many :item_orders, dependent: :destroy

  has_many :cart_items, dependent: :destroy
  
end
