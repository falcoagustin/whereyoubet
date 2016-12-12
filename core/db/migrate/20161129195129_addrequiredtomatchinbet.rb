class Addrequiredtomatchinbet < ActiveRecord::Migration
  def up
    change_table :bets do |t|
      t.change :match_id, :integer, null: false
    end
  end
  def down
    change_table :bets do |t|
      t.change :match_id, :integer, null: true
    end
  end
end
