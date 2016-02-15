require 'rails_helper'

RSpec.describe UserChannel, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:channel) }

  describe '#status' do
    context 'state machine' do
      let(:user)          { build(:user) }
      let(:channel)       { build(:channel) }
      let(:user_channel)  { build(:user_channel, user: user, channel: channel) }

      it 'returns waiting as initial status' do
        expect(user_channel.status).to eq('waiting')
      end

      it 'returns answering' do
        user_channel.answer
        expect(user_channel.status).to eq('answering')
      end
    end
  end
end
