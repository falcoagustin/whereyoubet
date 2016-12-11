class AddAprovedFieldToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :accepted, :boolean, :default => false
  end
end
