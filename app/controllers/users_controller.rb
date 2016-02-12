class UsersController < ApplicationController
  def queue
    user = User.find_by_login(params[:username])

    if user
      if user.has_channels?
        user.enter_in_channel('corporativo')
      end

      queue = user.queue
      render json: { queue: queue }
    else
      render text: 'not found', status: 404
    end
  end

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

