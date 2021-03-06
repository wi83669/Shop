class Order < ActiveRecord::Base
  attr_accessible :user, :status, :address

	has_many :order_items, dependent: :destroy
	belongs_to :user
	belongs_to :address

	def total
		total_value = 0
		order_items.each do |item|
			total_value += item.subtotal
		end
		return total_value
	end

end
