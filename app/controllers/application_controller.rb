class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :authenticate_user!
  #def authenticate_user!
  	#if user_signed_in?
  		#redirect_to root_path
  	#else
  		#render new_user_session_path
  	#end
  #end
end
