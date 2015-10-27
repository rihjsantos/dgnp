class SessionsController < ApplicationController
 	include SessionsHelper
 	layout "login"

 	# Login page
 	def new
 	end

 	def current_user
  		User.find_by(id: session[:user_id])
	end

 	# Authenticate the user
 	def create
 		user = User.find_by(email: params[:session][:email].downcase)
	    if user && user.authenticate(params[:session][:password])			
			log_in user
      		redirect_to :controller => 'admin', :action => 'index'
	    else
      		flash[:danger] = 'Combinação de e-mail/senha incorreta'
      		render 'new'
    	end
 	end

 	# Logout the user
 	def destroy
		session.delete(:user_id)
		@current_user = nil
		redirect_to :controller => 'sessions', :action => 'new'
	end
end
