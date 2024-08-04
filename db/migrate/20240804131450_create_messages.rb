# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
