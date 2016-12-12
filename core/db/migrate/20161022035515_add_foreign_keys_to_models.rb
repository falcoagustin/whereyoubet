class AddForeignKeysToModels < ActiveRecord::Migration
  def change
    add_foreign_key :bets, :users
    add_foreign_key :bets, :matches

    add_foreign_key :complete_bets, :bets, column: :first_bet_id
    add_foreign_key :complete_bets, :bets, column: :second_bet_id
    add_foreign_key :complete_bets, :bets, column: :third_bet_id

    add_foreign_key :matches, :teams, column: :local_team_id
    add_foreign_key :matches, :teams, column: :visitor_team_id

    add_foreign_key :teams, :countries
  end
end
