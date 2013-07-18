module ProductsHelper
	def print_price(price)
		number_to_currency price, unit: "$"
	end

	def print_stock(stock)
		if stock > 0
			return "In stock: " + stock.to_s
		else
			return "Out of stock"
		end
	end

end
