class AddPropertiesTouser < ActiveRecord::Migration
  def change
    remove_column :users, :username
    add_column :users, :last_name, :string, null: true
    add_column :users, :birthday, :datetime, null: true
    add_column :users, :address, :string, null: true
    add_column :users, :phone_number, :integer, null: true
  end
end
