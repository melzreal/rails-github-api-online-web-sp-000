class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user

  private

  def authenticate_user
   client_id = ENV['GITHUB_CLIENT_ID']
   redirect_uri = CGI.escape("http://localhost:3000/auth")
   git_url = "https://github.com/login/oauth/authorize"
   redirect_to git_url unless logged_in?
  end

  def logged_in?
    !!session[:user_id]
  end



end
