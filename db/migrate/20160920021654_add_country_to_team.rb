class AddCountryToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :country_id, :integer
  end
end
