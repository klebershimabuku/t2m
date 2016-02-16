class ChatController < ApplicationController
  def index
  end

  def support
  end

  def next
    protocol = protocol_finder_service.next
    join_service(protocol).join(params.require(:channel))

    render json: { conversation: protocol.conversation_id }, status: 200
  end

  def has_protocols?
    protocols = Protocol.waiting_in_channel(params.require(:channel))

    render json: { has_protocols: protocols.any? }, status: 200
  end

  def finalize
    protocol = protocol_finder_service.find_by_conversation(params.require(:id))
    protocol_finalizer_service(protocol).finalize

    join_service(protocol).out(protocol.channel.name)

    render json: { text: "Protocol #{protocol.id} finalized with success" }
  end

  def join_service(protocol)
    Chat::JoinService.new(params.require(:login), protocol)
  end

  def protocol_finder_service
    Protocol::FinderService.new
  end

  def protocol_finalizer_service(protocol)
    Protocol::FinalizerService.new(protocol)
  end
end
