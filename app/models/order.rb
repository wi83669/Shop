class Order < ActiveRecord::Base
  attr_accessible :user_id, :status

	has_many :order_items, dependent: :destroy

	def total
		total_value = 0
		order_items.each do |item|
			total_value += item.subtotal
		end
		return total_value
	end

end
