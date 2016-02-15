require 'rails_helper'

RSpec.describe Channel do
  it { should have_many(:user_channels) }
  it { should have_many(:users).through(:user_channels) }
  it { should have_many(:protocols) }

  describe '.find_protocols_by_channel' do
    let(:corporativo_channel) { build(:channel, name: 'corporativo') }
    let(:host_channel)        { build(:channel, name: 'host') }

    let!(:protocols) do
      Protocol.create(channel: corporativo_channel)
      Protocol.create(channel: corporativo_channel)
      Protocol.create(channel: host_channel)
    end

    subject { Channel.find_protocols_by_channel('corporativo') }

    it 'returns all protocols' do
      expect(subject.size).to eq(2)
    end
  end
end
