class RemoveIndividualBetAmountToCompleteBet < ActiveRecord::Migration
  def change
    remove_column :bets, :amount
    add_column :complete_bets, :amount, :float
  end
end
