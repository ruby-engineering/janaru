# frozen_string_literal: true

class CreateSubscribers < ActiveRecord::Migration[7.1]
  def change
    create_table :subscribers do |t|
      t.string :name
      t.string :email
      t.boolean :confirmed, null: false
      t.datetime :confirmed_at
      t.string :confirmation_token, null: false
      t.references :article, foreign_key: true, null: true

      t.timestamps
    end

    add_index :subscribers, :email, unique: true, name: 'idx_subscribers_email'
  end
end
