require 'rails_helper'

RSpec.describe 'conversations routing', type: :routing do
  it 'routes to conversations#create' do
    expect(post: '/conversations').to route_to(
      controller: 'conversations',
      action: 'create'
    )
  end
end
