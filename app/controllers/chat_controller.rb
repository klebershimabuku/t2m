class ChatController < ApplicationController
  def index
  end

  def support
  end

  def next
    username  = params[:username]
    protocols = Channel.find_protocols_by_channel(params[:channel])
    protocol  = Protocol.next(protocols)
    protocol.add_participant_into_conversation(username)
    render json: { conversation: protocol.conversation_id }, status: 200
  end

end
