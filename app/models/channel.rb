class Channel < ActiveRecord::Base
  has_many :user_channels
  has_many :users, through: :user_channels
end
