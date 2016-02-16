class ConversationsController < ApplicationController
  def create
    # creates a conversation
    username = params[:username]
    channel  = Channel.find_by_name(params[:channel])
    conversation = Layer::Conversation.create(participants: [username])

    # creates a protocol
    protocol = Protocol.create(customer_login: username,
                               channel: channel,
                               conversation_id: conversation.id,
                               phone: '(XX) 111-11111')

    render json: { id: conversation.id }, status: 201
  end

  def messages
    @conversation = Layer::Conversation.find(params[:conversation_id])
    render json: @conversation.messages.to_json, status: 200
  end
end
