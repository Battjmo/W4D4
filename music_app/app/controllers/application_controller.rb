class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in?
  helper_method :log_in_user!

  def log_in_user!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def logged_in?
    !current_user.nil?
  end

  def logout!
      current_user.try(:reset_session_token!)
      session[:session_token] = nil
    end

    
  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end


end
