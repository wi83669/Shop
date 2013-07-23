class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.all
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    @order = current_user.orders.new
  end

  def create
		
    @order = current_user.orders.new(params[:order])
    if @order.save
      redirect_to @order, :notice => "Successfully created order."
    else
      render :action => 'new'
    end
  end

  def edit
    @order = current_user.orders.find(params[:id])
  end

  def update
    @order = current_user.orders.find(params[:id])
    if @order.update_attributes(params[:address_id])
      redirect_to @order, :notice  => "Successfully updated order."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order = current_user.orders.find(params[:id])
    @order.destroy
    redirect_to products_path, :notice => "Successfully destroyed order."
  end

	def purchase
		# Find the order
		# Set the address_id
		# Change the status to "submitted"
		# Save it
		# Remove the order_id from the session so they can't edit it
		# Display a thank you page with an order summary
		@order = current_user.orders.last
		@order.address = params[:address_id]
		@order.status = "submitted"
		@order.save
		session[:order_id] = nil
		redirect_to orders_path, :notice => "Thank you for buying in our shop."
	end
end
