class User < ActiveRecord::Base
  has_many :user_channels
  has_many :channels, through: :user_channels

  def queue
    'corporativo'
  end

  def has_channels?
    self.user_channels.present?
  end

  def user_channel_by_name(name = 'corporativo')
    self.user_channels.joins(:channel).where('channels.name' =>  'corporativo').first
  end

  def enter_in_channel(name)
    user_channel_by_name.update(status: UserChannel::Statuses::ANSWERING)
  end

end
