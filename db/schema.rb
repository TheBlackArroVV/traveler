ActiveRecord::Schema.define(version: 20_190_103_152_745) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cities', force: :cascade do |t|
    t.string 'name'
    t.bigint 'country_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['country_id'], name: 'index_cities_on_country_id'
  end

  create_table 'countries', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'images', force: :cascade do |t|
    t.string 'image'
    t.bigint 'sight_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['sight_id'], name: 'index_images_on_sight_id'
  end

  create_table 'memberships', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'trip_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['trip_id'], name: 'index_memberships_on_trip_id'
    t.index ['user_id'], name: 'index_memberships_on_user_id'
  end

  create_table 'messages', force: :cascade do |t|
    t.string 'text'
    t.bigint 'user_id'
    t.bigint 'topic_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['topic_id'], name: 'index_messages_on_topic_id'
    t.index ['user_id'], name: 'index_messages_on_user_id'
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

  create_table 'sights', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.bigint 'city_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['city_id'], name: 'index_sights_on_city_id'
  end

  create_table 'topics', force: :cascade do |t|
    t.string 'title'
    t.string 'description'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_topics_on_user_id'
  end

  create_table 'trips', force: :cascade do |t|
    t.string 'description'
    t.string 'budget'
    t.integer 'max_members'
    t.bigint 'city_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['city_id'], name: 'index_trips_on_city_id'
    t.index ['user_id'], name: 'index_trips_on_user_id'
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
