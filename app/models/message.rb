# frozen_string_literal: true

class Message < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, on: :create
  validates :content, presence: true, on: :create
end
