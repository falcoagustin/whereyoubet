class Addmatchapiid < ActiveRecord::Migration
  def change
    add_column :matches, :api_id, :integer
  end
end
