class Authenticate::CreatorService
  def initialize(user)
    @user = user
  end

  def token
    client = Layer::Client.authenticate do |nonce|
      Layer::IdentityToken.new(@user.login, nonce)
    end
    client.token
  end

end
