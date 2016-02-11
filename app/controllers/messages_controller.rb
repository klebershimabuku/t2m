class MessagesController < ApplicationController
  def create
    conversation = Layer::Conversation.find(conversation_params[:id])
    message = conversation.messages.create(message_params)
    render json: message, status: 201
  end

  def conversation_params
    params.require(:conversation)
  end

  def message_params
    {
      sender: conversation_params[:sender],
      parts: conversation_params[:parts].values
    }
  end
end
