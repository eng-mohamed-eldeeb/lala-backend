class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :img_url, :string
    add_column :users, :is_admin, :boolean
  end
end
