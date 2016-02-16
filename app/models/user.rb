class User < ActiveRecord::Base
  has_many :user_channels
  has_many :channels, through: :user_channels

  def has_channels?
    self.user_channels.present?
  end

  def user_channel_by_name(name = 'corporativo')
    self.user_channels.joins(:channel).where('channels.name' => name).first
  end

  def enter_in_channel(name)
    user_channel = user_channel_by_name(name)
    user_channel.answer! if user_channel.may_answer?
  end

  def out_of_channel(name)
    user_channel = user_channel_by_name(name)
    user_channel.wait! if user_channel.may_wait?
  end

  def self.create_with_login(login)
    self.create(login: login)
  end

end
