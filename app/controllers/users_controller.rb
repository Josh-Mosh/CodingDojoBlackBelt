class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def create
  	puts params[:user]
  	# @user = User.new(params[:user])
  	@user = User.new(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
  	if @user.save
  		flash[:success] = "Successfully Registered"
  		redirect_to '/login'
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to '/register'
  	end
  end

  def show
  	@user = User.find(params[:id])
  	@product = Product.new
  	@products = @user.products.where("status = 't'")
  	@purchases = Purchase.all.where("user_id = #{session[:user_id]}")
  	@sales = Sale.all.where("user_id = #{session[:user_id]}")
  end
end
