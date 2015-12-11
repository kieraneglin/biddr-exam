class AddHighestbidToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :highest_bid, :string
  end
end
