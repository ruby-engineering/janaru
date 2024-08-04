# frozen_string_literal: true

class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.string :slug, null: false

      t.timestamps
    end

    add_index :tags, :slug, unique: true, name: 'idx_tags_slug'
    add_index :tags, :name, unique: true, name: 'idx_tags_name'
  end
end
