class AuthenticationController < ApplicationController
  def authenticate
    user = params[:user_id]

    client = Layer::Client.authenticate do |nonce|
      Layer::IdentityToken.new(user, nonce)
    end

    # verifies if the user is support analyst
    #
    if user == 'aladdin' # identifies as a support analyst
      # adds the user into the online queue
      UserManager.add_online(user)
      # creates a queue for this specific analyst
      analyst = User.find_by_login(user)
      MyQueue.add(analyst)
    else # potential buyer or customer
    end

    render json: { session_token: client.token }
  end
end
