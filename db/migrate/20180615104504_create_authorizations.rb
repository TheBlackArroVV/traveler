class CreateAuthorizations < ActiveRecord::Migration[5.2]
  def change
    create_table :authorizations do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
    end
    add_index :authorizations, :user_id
    add_index :authorizations, [:provider, :uid]
  end
end
