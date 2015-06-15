class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_player, :signed_in?

  private

  def current_player
    return nil unless session[:token]
    @current_player ||= Player.find_by_session_token(session[:token])
  end

  def signed_in?
    !!current_player
  end

  def is_admin?
  end

  def sign_in!(player)
    @current_player = player
    session[:token] = player.reset_token!
  end

  def sign_out!
    current_player.try(:reset_token!)
    session[:token] = nil
  end

  def require_signed_in!
    redirect_to new_session_url unless signed_in?
  end


end
