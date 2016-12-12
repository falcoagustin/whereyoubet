class CreateCompleteBets < ActiveRecord::Migration
  def change
    create_table :complete_bets do |t|
      t.timestamps null: false
      t.references :first_bet, null: true
      t.references :second_bet, null: true
      t.references :third_bet, null: true
    end
  end
end
