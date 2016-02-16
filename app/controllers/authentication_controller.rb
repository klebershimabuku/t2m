class AuthenticationController < ApplicationController
  def authenticate
   render json: { session_token: create_and_authenticate }
  end

  def creator_service
    Authenticate::CreatorService.new(@user)
  end

  def finder_service(user_id)
    Authenticate::FinderService.new(user_id)
  end

  def create_and_authenticate
    login = params.require(:user_id)
    @user = finder_service(login).call
    @user ||= User.create_with_login(login)

    creator_service.token
   end
end
