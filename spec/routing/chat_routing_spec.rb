require 'rails_helper'

RSpec.describe 'chat routing', type: :routing do
  it 'routes to chat#index' do
    expect(get: '/chat').to route_to(
      controller: 'chat',
      action: 'index'
    )
  end

  it 'routes to chat#support' do
    expect(get: '/chat/support').to route_to(
      controller: 'chat',
      action: 'support'
    )
  end

  it 'routes to chat#next' do
    channel = 'corporativo'

    expect(post: "/chat/#{channel}/next").to route_to(
      controller: 'chat',
      action: 'next',
      channel: channel
    )
  end

  it 'routes to chat#finalize' do
    expect(post: '/chat/finalize').to route_to(
      controller: 'chat',
      action: 'finalize'
    )
  end
end
