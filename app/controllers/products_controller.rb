class ProductsController < ApplicationController
  def index
  	@products = Product.all.where("status = 't'")
  	@user = User.find(session[:user_id])
  	@purchase = Purchase.new
  end

  def create
  	p = Product.new(name: params[:product][:name], price: params[:product][:price], user_id: session[:user_id], status: true)
  	p.save
  	if p.save
  		flash[:success] = "Successfully added new product"
  		redirect_to '/products'
  	else
  		flash[:errors] = p.errors.full_messages
  		redirect_to :back
  	end
  end

  def destroy
  	Product.destroy(params[:product][:product_id])
  	redirect_to :back
  end
end
