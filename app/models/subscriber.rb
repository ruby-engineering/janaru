# frozen_string_literal: true

class Subscriber < ApplicationRecord
  belongs_to :article, optional: true

  validates :email, presence: true, uniqueness: true, on: :create
end
