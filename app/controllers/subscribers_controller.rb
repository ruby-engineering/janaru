# frozen_string_literal: true

class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
    @articles = Article.all
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)

    @articles = Article.all

    if @subscriber.save
      redirect_to @subscriber, notice: 'Subscriber was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :email, :confirmed, :confirmed_at, :confirmation_token, :article_id)
  end

  def set_subscriber
    @subscriber = Subscriber.find(params[:id])
  end
end
