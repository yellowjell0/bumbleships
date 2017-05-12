class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_player
    return unless session[:player_id]
    @current_player ||= Player.find(session[:player_id])
  end
end
