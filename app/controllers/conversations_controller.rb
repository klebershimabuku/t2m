class ConversationsController < ApplicationController

  def create
    participants = params[:participants]
    channel = Channel.find_by_name(params[:queue])
    conversation = Layer::Conversation.create(participants: participants)
    Protocol.create(customer_login: participants.first, channel: channel, conversation_id: conversation.id,
                    phone: '(XX) XXXX-XXXX', status:  Protocol::Statuses::WAITING)
    render json: { id: conversation.id }, status: 201
  end
end
#
#      t.string :customer_login
#      t.references :channel, index: true, foreign_key: true
#      t.string :conversation_id
#      t.string :phone
#      t.string :status
#      t.date :finalized_at
#

