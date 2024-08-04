# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_back_or_to(root_path)
  end

  # Force 2fa like you force authentication
  # Remember to set OTP mandatory for all users or for single user
  # before_action :ensure_mandatory_user_otp!
  before_action :http_authenticate

  def http_authenticate
    return unless Rails.env.staging?

    authenicated_users = {
      ENV.fetch('HTTP_BASIC_AUTH_USERNAME') => ENV.fetch('HTTP_BASIC_AUTH_PASSWORD')
    }

    authenticate_or_request_with_http_digest do |username|
      authenicated_users[username]
    end
  end
end
