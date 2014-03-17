class PurchasesController < ApplicationController
  def create
  	puts params
  	
  	Purchase.new(user_id: session[:user_id], product_id: params[:purchase][:product_id]).save 
  	Sale.new(user_id: params[:purchase][:user_id], product_id: params[:purchase][:product_id], buyer_id: session[:user_id]).save
  	p = Product.find(params[:purchase][:product_id])
  	p.status = false
  	p.save

  	flash[:bought] = "Product Purchased Successfully!"
  	redirect_to "/products"
  end
end