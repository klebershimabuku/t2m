class ChatController < ApplicationController
  def index
  end

  def support
  end

  def next
    username  = params[:username]
    protocols = Channel.find_protocols_by_channel(params[:channel])
    protocol  = Protocol.next
    protocol.add_participant_into_conversation(username)

    render json: { conversation: protocol.conversation_id }, status: 200
  end

  def finalize
    conversation_id = params[:id]
    protocol = Protocol.find_by_conversation_id(conversation_id)
    protocol.finalize!
    protocol.remove_participant_from_conversation(params[:username])

    render json: { text: "Protocol #{protocol.id} finalized with success" }
  end
end
