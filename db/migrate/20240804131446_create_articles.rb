# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.integer :status, null: false, default: 0
      t.references :user, foreign_key: true, null: true
      t.references :category, foreign_key: true, null: true

      t.datetime :discarded_at, index: true

      t.timestamps
    end

    add_index :articles, :slug, unique: true, name: 'idx_articles_slug'
  end
end
