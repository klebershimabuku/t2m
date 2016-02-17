class Chat::JoinService
  def initialize(login, protocol)
    @protocol = protocol
    @user = User.find_by_login(login)
  end

  def join(channel)
    @protocol.add_participant_into_conversation(@user.login)
    @user.enter_in_channel(channel)
  end

  def out(channel)
    @protocol.remove_participant_from_conversation(@user.login)
    @user.out_of_channel(channel)
  end
end
