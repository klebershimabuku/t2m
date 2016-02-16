class UsersController < ApplicationController

  def join
    user = User.find_by_login(params[:username])

    channel = params[:channel]

    if user
      if user.has_channels?
        user.enter_in_channel(channel)
      end
    end

    render json: { channel: channel }, status: 200
  end


end
