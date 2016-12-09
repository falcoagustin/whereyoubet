class CreateMatchResults < ActiveRecord::Migration
  def change
    create_table :match_results do |t|
      t.integer :winner
      t.belongs_to :match, index: true, unique: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
