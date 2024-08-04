# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_804_131_535) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'action_text_rich_texts', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'body'
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[record_type record_id name], name: 'index_action_text_rich_texts_uniqueness', unique: true
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'articles', force: :cascade do |t|
    t.string 'title', null: false
    t.string 'slug', null: false
    t.integer 'status', default: 0, null: false
    t.bigint 'user_id'
    t.bigint 'category_id'
    t.datetime 'discarded_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_articles_on_category_id'
    t.index ['discarded_at'], name: 'index_articles_on_discarded_at'
    t.index ['slug'], name: 'idx_articles_slug', unique: true
    t.index ['user_id'], name: 'index_articles_on_user_id'
  end

  create_table 'articles_tags', force: :cascade do |t|
    t.bigint 'tag_id'
    t.bigint 'article_id'
    t.index ['article_id'], name: 'index_articles_tags_on_article_id'
    t.index ['tag_id'], name: 'index_articles_tags_on_tag_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'slug', null: false
    t.bigint 'parent_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'idx_categories_name', unique: true
    t.index ['parent_id'], name: 'index_categories_on_parent_id'
    t.index ['slug'], name: 'idx_categories_slug', unique: true
  end

  create_table 'messages', force: :cascade do |t|
    t.string 'name'
    t.string 'email', null: false
    t.text 'content', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'subscribers', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.boolean 'confirmed', null: false
    t.datetime 'confirmed_at'
    t.string 'confirmation_token', null: false
    t.bigint 'article_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['article_id'], name: 'index_subscribers_on_article_id'
    t.index ['email'], name: 'idx_subscribers_email', unique: true
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'slug', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'idx_tags_name', unique: true
    t.index ['slug'], name: 'idx_tags_slug', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'encrypted_password', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'invitation_token'
    t.datetime 'invitation_created_at'
    t.datetime 'invitation_sent_at'
    t.datetime 'invitation_accepted_at'
    t.integer 'invitation_limit'
    t.integer 'invited_by_id'
    t.string 'invited_by_type'
    t.string 'otp_auth_secret'
    t.string 'otp_recovery_secret'
    t.boolean 'otp_enabled', default: false, null: false
    t.boolean 'otp_mandatory', default: false, null: false
    t.datetime 'otp_enabled_on'
    t.integer 'otp_failed_attempts', default: 0, null: false
    t.integer 'otp_recovery_counter', default: 0, null: false
    t.string 'otp_persistence_seed'
    t.string 'otp_session_challenge'
    t.datetime 'otp_challenge_expires'
    t.integer 'role', default: 0, null: false
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'idx_users_email', unique: true
    t.index ['invitation_token'], name: 'idx_users_invitation_token', unique: true
    t.index ['otp_challenge_expires'], name: 'idx_users_otp_challenge_expires'
    t.index ['otp_session_challenge'], name: 'idx_users_otp_session_challenge', unique: true
    t.index ['reset_password_token'], name: 'idx_users_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'articles', 'categories'
  add_foreign_key 'articles', 'users'
  add_foreign_key 'categories', 'categories', column: 'parent_id'
  add_foreign_key 'subscribers', 'articles'
end
