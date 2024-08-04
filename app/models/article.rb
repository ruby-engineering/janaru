# frozen_string_literal: true

class Article < ApplicationRecord
  include Discard::Model

  enum status: { created: 0, published: 1, archived: 2 }

  has_rich_text :content

  belongs_to :user, optional: true
  has_and_belongs_to_many :tags
  belongs_to :category, optional: true
  has_many :subscribers

  validates :title, presence: true
  validates :content, presence: true
  validates :slug, presence: true, uniqueness: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[title]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end
end
