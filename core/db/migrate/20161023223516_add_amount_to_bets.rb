class AddAmountToBets < ActiveRecord::Migration
  def change
    add_column :bets, :amount, :integer
  end
end
