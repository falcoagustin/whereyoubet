class Team < ActiveRecord::Base
  belongs_to :country, :class_name => 'Country', :foreign_key => 'country_id'
end
