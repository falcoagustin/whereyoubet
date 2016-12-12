class Completebetadduserid < ActiveRecord::Migration
  def change
    add_column :complete_bets, :user_id, :integer
    add_foreign_key :complete_bets, :users, column: :user_id
  end
end
