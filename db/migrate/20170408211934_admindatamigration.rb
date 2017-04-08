class Admindatamigration < ActiveRecord::Migration
  def change
    admin = User.create(email: 'admin@admin.com', password: 'admin1234')
  end
end
