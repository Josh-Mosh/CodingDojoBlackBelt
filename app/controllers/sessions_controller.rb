class SessionsController < ApplicationController
 
  def new
  end

  def create
  	user = User.authenticate(params[:session][:email], params[:session][:password])

  	if user.nil?
  		flash[:error] = "Invalid email or password"
  		redirect_to "/login"
  	else
  		session[:user_id] = user.id
  		redirect_to '/products'
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to '/login'
  end
end
