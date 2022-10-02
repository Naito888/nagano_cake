class Order < ApplicationRecord
  
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  attr_accessor :address_option

  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum is_active: {
     販売中: true,
     販売停止中: false
   }

  enum status: {
    waiting_for_deposit: 0,
    payment_confirmation: 1,
    production: 2,
    ready_to_ship: 3,
    shipped: 4
  }
  
end
