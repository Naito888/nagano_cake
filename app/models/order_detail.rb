class OrderDetail < ApplicationRecord
  
  belongs_to :order
  belongs_to :item

  enum making_status: {
    cannot_be_manufactured: 0,
    waiting_for_production: 1,
    production: 2,
    production_completed: 3
  }

  def with_tax_price
   (price * 1.1).floor
  end

  def subtotal
    item.with_tax_price * amount
  end

  def total
    order_detail.subtotal + order.shipping_cost
  end

end
