require 'rails_helper'

RSpec.describe Protocol, type: :model do

  let(:protocol) { Protocol.new }

  before do 
    protocol.customer_login = 'bento.carneiro'
    protocol.channel_id = 100001
    protocol.conversation_id = '12345qwer'
    protocol.phone = '66666666666'
    protocol.status = 'waiting'
    protocol.in_progress_at = DateTime.now 
    protocol.finalized_at = DateTime.now
    protocol.created_at = DateTime.now
    protocol.updated_at = DateTime.now
    protocol.save!
  end

  pending "add some examples to (or delete) #{__FILE__}"

  describe '#duration' do 
    subject { protocol.duration }
    before do 
     protocol.finalized_at = DateTime.now + 10.seconds
     protocol.created_at = DateTime.now
    end
    it { subject.should == 10 }
  end

end




