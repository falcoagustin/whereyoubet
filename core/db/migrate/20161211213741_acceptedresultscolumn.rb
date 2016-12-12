class Acceptedresultscolumn < ActiveRecord::Migration
  def up
    change_table :match_results do |t|
      t.change :match_id, :integer, null: false
    end
    add_column :match_results, :accepted, :boolean, :default => false, null: false
  end
  def down
    change_table :match_results do |t|
      t.change :match_id, :integer, null: true
    end
    remove_column :match_results, :accepted
  end
end
