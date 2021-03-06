class AddressesController < ApplicationController
	before_filter :load_order

  def index
    @addresses = current_user.addresses.all
  end

  def show
    @address = current_user.addresses.find(params[:id])
  end

  def new
    @address = current_user.addresses.build(params[:address])
  end

  def create
    @address = current_user.addresses.new(params[:address])
    if @address.save
      redirect_to orders_path, :notice => "Successfully created address."
    else
      render :action => 'new'
    end
  end

  def edit
    @address = current_user.addresses.find(params[:id])
  end

  def update
    @address = current_user.address.find(params[:id])
    if @address.update_attributes(params[:address])
      redirect_to @address, :notice  => "Successfully updated address."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @address = current_user.addresses.find(params[:id])
    @address.destroy
    redirect_to addresses_url, :notice => "Successfully destroyed address."
  end
end
