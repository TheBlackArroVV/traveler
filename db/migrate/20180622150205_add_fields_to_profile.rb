class AddFieldsToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :about, :string
  end
end
