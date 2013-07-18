class AddStockToProducts < ActiveRecord::Migration
	add_column :products, :stock, :integer, default: 0

  def change
  end
end
