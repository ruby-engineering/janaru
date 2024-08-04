# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.references :parent, foreign_key: { to_table: :categories }, null: true

      t.timestamps
    end

    add_index :categories, :slug, unique: true, name: 'idx_categories_slug'
    add_index :categories, :name, unique: true, name: 'idx_categories_name'
  end
end
