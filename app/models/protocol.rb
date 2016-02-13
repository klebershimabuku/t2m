class Protocol < ActiveRecord::Base
  belongs_to :channel

  def add_participant_into_conversation(login)
    conversation = Layer::Conversation.find(self.conversation_id)
    conversation.participants << login
    conversation.save
  end

  def self.next(protocols)
    protocols.last
  end
end
