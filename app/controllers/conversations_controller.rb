class ConversationsController < ApplicationController
  def create
    participants = params[:participants]
    conversation = Layer::Conversation.create(participants: participants)
    render json: { id: conversation.id }, status: 201
  end
end
