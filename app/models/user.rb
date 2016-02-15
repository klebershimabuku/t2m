class User < ActiveRecord::Base
  has_many :user_channels
  has_many :channels, through: :user_channels

  def has_channels?
    self.user_channels.present?
  end

  def user_channel_by_name(name = 'corporativo')
    self.user_channels.joins(:channel).where('channels.name' =>  'corporativo').first
  end

  def enter_in_channel(name)
    user_channel_by_name.answer!
  end

  def out_of_channel(name)
    user_channel_by_name.wait!
  end

end
