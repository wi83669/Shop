class OrderItem < ActiveRecord::Base
  attr_accessible :product_id, :order_id, :quantity
	belongs_to :order
	belongs_to :product

	validates :product_id, presence: true
	validates :order_id, presence: true

	def subtotal
		product.price * quantity			
	end

end
