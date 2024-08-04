# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :articles
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
end
