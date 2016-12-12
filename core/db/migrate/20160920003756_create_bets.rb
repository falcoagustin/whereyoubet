class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.timestamp :executed
      t.references :user, index: true, foreign_key: true
      t.float :amount
      t.references :match, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
