class AuthenticationController < ApplicationController
  def authenticate
    user = params[:user_id]

    client = Layer::Client.authenticate do |nonce|
      Layer::IdentityToken.new(user, nonce)
    end

    # verifies if the user is support analyst
    #
    if User.find_by_login(user) # identifies as a support analyst

    else # potential buyer or customer
    end

    render json: { session_token: client.token }
  end
end
