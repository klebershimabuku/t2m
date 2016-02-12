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
end

