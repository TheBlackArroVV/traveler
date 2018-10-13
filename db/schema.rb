ActiveRecord::Schema.define(version: 20_180_820_102_114) do
  enable_extension 'plpgsql'

  create_table 'authorizations', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'provider'
    t.string 'uid'
    t.index %w[provider uid], name: 'index_authorizations_on_provider_and_uid'
    t.index ['user_id'], name: 'index_authorizations_on_user_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'title'
    t.string 'body'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'profiles', force: :cascade do |t|
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'about'
    t.string 'avatar'
    t.index ['user_id'], name: 'index_profiles_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.boolean 'admin', default: false
    t.integer 'phone_number'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
