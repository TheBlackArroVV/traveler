class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :description
      t.string :budget
      t.integer :max_members
      t.belongs_to :city

      t.timestamps
    end
  end
end
