class AddUserBetChoice < ActiveRecord::Migration
  def change
    add_column :bets, :bet_on_local, :boolean, null: false, default: false
    add_column :bets, :bet_on_visitor, :boolean, null: false, default: false
    add_column :bets, :bet_on_tie, :boolean, null: false, default: false
  end
end
