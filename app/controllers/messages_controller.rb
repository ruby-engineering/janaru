# frozen_string_literal: true

class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to @message, notice: 'Message was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
