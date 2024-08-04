# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :validatable, :invitable, :trackable, :recoverable, :rememberable,
         :otp_authenticatable
  enum role: { redactor: 0, admin: 1 }

  has_many :articles
end
