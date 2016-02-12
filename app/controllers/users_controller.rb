class UsersController < ApplicationController
  def queue
    user = User.find_by_login(params[:username])

    if user
      queue = user.queue
      render json: { queue: queue }
    else
      render text: 'not found', status: 404
    end
  end

#  def online
#    queue_name = params[:queue]
#    Protocol.create(customer_login:
#   # # checks for available support analyst for this queue
#   # if MyQueue.online(queue_name).any?
#   #   # picks somebody from these online users
#   #   render json: { user: MyQueue.online(queue_name).sample }
#   # else
#   #   render text: 'no available support now', status: 404
#   # end
#  end
end

