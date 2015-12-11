class MakeEndTimeDateTime < ActiveRecord::Migration
  def change
    remove_column :auctions, :end_time
    add_column :auctions, :end_time, :datetime
  end
end
