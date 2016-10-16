class Match < ActiveRecord::Base
  require 'csv'
  belongs_to :local_team, :class_name => 'Team'
  belongs_to :visitor_team, :class_name => 'Team'
  has_many :teams

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      byebug
      match_hash = row.to_hash
      Match.create!(match_hash)
    end
  end
end
