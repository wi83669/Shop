module ProductsHelper
	def print_price(price)
		number_to_currency price, unit: "$"
	end

	def print_stock(stock, requested = 1)
		if stock <= 0
			return "Out of stock"			
		elsif stock >= requested
			return "In stock: " + stock.to_s
		elsif stock < requested
			return "Insufficient Stock"
		end
	end

end
