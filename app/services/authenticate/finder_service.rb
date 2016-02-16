class Authenticate::FinderService
  def initialize(user_id)
    @user_id = user_id
  end

  def call
    User.find_by_login(@user_id)
  end

end
