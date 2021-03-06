class OrderItem < ActiveRecord::Base
  attr_accessible :product_id, :order_id, :quantity
	belongs_to :order
	belongs_to :product

	validates :product_id, presence: true
	validates :order_id, presence: true
	validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

	def subtotal
		product.price.to_f * quantity.to_f		
	end

end
