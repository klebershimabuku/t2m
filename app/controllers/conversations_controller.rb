class ConversationsController < ApplicationController
  def create
    conversation = conversation_creator_service([params.require(:login)]).call

    channel  = channel_finder_service.find_by_name(params.require(:channel))
    protocol = protocol_creator_service(channel, conversation).call

    render json: { id: conversation.id }, status: 201
  end

  def messages
    @conversation = finder_service.call
    render json: @conversation.messages.to_json, status: 200
  end

  def finder_service
    Conversation::FinderService.new(params.require(:conversation_id))
  end

  def channel_finder_service
    Channel::FinderService.new
  end

  def protocol_creator_service(channel, conversation)
    Protocol::CreatorService.new(params.require(:login), channel, conversation)
  end

  def conversation_creator_service(participants)
    Conversation::CreatorService.new(participants)
  end
end
