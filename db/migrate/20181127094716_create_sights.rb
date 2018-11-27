class CreateSights < ActiveRecord::Migration[5.2]
  def change
    create_table :sights do |t|
      t.string :name
      t.string :description
      t.belongs_to :city

      t.timestamps
    end
  end
end
