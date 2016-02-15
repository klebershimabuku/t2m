FactoryGirl.define do
  factory :user_channel do
    user { build(:user) }
    channel { build(:channel) }
    status 'waiting'
  end
end
