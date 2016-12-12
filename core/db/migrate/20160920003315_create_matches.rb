class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.timestamp :time
      t.float :local_ratio
      t.float :visitor_ratio
      t.float :tie_ratio

      t.references :local_team
      t.references :visitor_team

      t.timestamps null: false
    end
  end
end
