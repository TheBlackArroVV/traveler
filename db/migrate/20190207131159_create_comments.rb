class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false
      t.belongs_to :post, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
