class OrderItemsController < ApplicationController
	before_filter :load_order, only: [:create]

  def create
		@order_item = @order.order_items.find_or_initialize_by_product_id(product_id: params[:product_id])
		@order_item.quantity += 1
		if @order_item.save
		  redirect_to @order, notice: "Successfully created order item."
		else
		  render action: 'new'
		end
	end

  def edit
    @order_item = OrderItem.find(params[:id])
  end

  def update
    @order_item = OrderItem.find(params[:id])
		if params[:order_item][:quantity] == '0'
			@order_item.destroy
			redirect_to orders_path, :notice => "Successfully destroyed order item."
    elsif @order_item.update_attributes(params[:order_item])
      redirect_to orders_path, :notice  => "Successfully updated order item."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to orders_path, :notice => "Successfully destroyed order item."
  end
end
