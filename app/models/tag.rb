# frozen_string_literal: true

class Tag < ApplicationRecord
  has_and_belongs_to_many :articles

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
end
