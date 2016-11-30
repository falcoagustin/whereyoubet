class Addrequiredtomatchinbet < ActiveRecord::Migration
  def change
    change_column :bets, :match_id, :integer, null: false
  end
end
