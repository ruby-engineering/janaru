# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer :sign_in_count, null: false, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
      t.string :invitation_token
      t.datetime :invitation_created_at
      t.datetime :invitation_sent_at
      t.datetime :invitation_accepted_at
      t.integer :invitation_limit
      t.integer :invited_by_id
      t.string :invited_by_type
      t.string :otp_auth_secret
      t.string :otp_recovery_secret
      t.boolean :otp_enabled, null: false, default: false
      t.boolean :otp_mandatory, null: false, default: false
      t.datetime :otp_enabled_on
      t.integer :otp_failed_attempts, null: false, default: 0
      t.integer :otp_recovery_counter, null: false, default: 0
      t.string :otp_persistence_seed
      t.string :otp_session_challenge
      t.datetime :otp_challenge_expires
      t.integer :role, null: false, default: 0
      t.string :name, null: false

      t.timestamps
    end

    add_index :users, :email, unique: true, name: 'idx_users_email'
    add_index :users, :reset_password_token, unique: true, name: 'idx_users_reset_password_token'
    add_index :users, :invitation_token, unique: true, name: 'idx_users_invitation_token'
    add_index :users, :otp_session_challenge, unique: true, name: 'idx_users_otp_session_challenge'
    add_index :users, :otp_challenge_expires, name: 'idx_users_otp_challenge_expires'
  end
end
