# frozen_string_literal: true

class CreateArticlesTags < ActiveRecord::Migration[7.1]
  def change
    create_table :articles_tags do |t|
      t.belongs_to :tag
      t.belongs_to :article
    end
  end
end
