class AddVisitsToLinks < ActiveRecord::Migration
  def up
    add_column :links, :visits, :integer
    Link.reset_column_information
    Link.find(:all).each do |l|
      l.update_attributes :visits, 0
    end
  end
  
  def down
    remove_column :links, :visits
  end
end
