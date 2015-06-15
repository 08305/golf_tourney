class SessionsController < ApplicationController
  def new; end

  def create
    @player = Player.find_by_credentials(params[:player])

    if @player
      sign_in!(@player)
      redirect_to player_url(@player)
    else
      flash.now[:errors] = ["Invalid player name and/or password"]
      render :new
    end
  end

  def destroy
    sign_out!
    redirect_to new_session_url
  end
end
