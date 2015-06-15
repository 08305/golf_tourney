class PlayersController < ApplicationController
  def new; end

  def create
    @player = player_params ? Player.new(player_params) : Player.new_guest
    if @player.save
      current_player.move_to(@player) if current_player
      session[:player_id] = @player.id
      redirect_to player_url(@player)
    else
      render "show"
    end
  end

  def show
    @player = Player.find(params[:id])
    render :show
  end

  private

  def player_params
    params.require(:player).permit(:playername, :password, :session_token)
  end
end
