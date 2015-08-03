class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


private

	# Store our ID in the session and set the 
	# current_user instance variable.
	def sign_in(user)
		session[:user_id] = user.id
		@current_user = user
	end


	def sign_out
		@current_user = nil
		session.delete(:user_id)
	end


	# If our session is set then set our @current_user
	# Otherwise query the db using the session
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]		
	end
	helper_method :current_user


	# Just turn @current_user into a boolean
	def signed_in_user?
		!!current_user
	end
	helper_method :signed_in_user?


end
