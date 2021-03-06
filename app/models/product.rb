class Product < ActiveRecord::Base
  attr_accessible :title, :price, :description, :image_url, :stock
	has_many :order_items


	validates_numericality_of :price
	validates :stock, presence: true, numericality: { only_intger: true, greater_than_or_equal_to: 0 }

	def price=(value)
		value.delete!("$")
		super
	end
end



