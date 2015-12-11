class RemoveHighestFromAuctions < ActiveRecord::Migration
  def change
    remove_column :auctions, :highest_bid
  end
end
