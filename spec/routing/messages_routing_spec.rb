require 'rails_helper'

RSpec.describe 'messages routing', type: :routing do
  it 'routes to messages#create' do
    expect(post: '/messages').to route_to(
      controller: 'messages',
      action: 'create'
    )
  end
end
