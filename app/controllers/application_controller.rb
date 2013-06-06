class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user
  def authenticate_user
    redirect_to(new_user_session_path) and return if (!user_signed_in? && (params[:controller] == "displays" || params[:controller] == "scrapers" || params[:controller] == "documents"))
  	#コントローラーが増えるたびに追加するのは面倒
  end
end
