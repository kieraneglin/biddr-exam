class AddCurrentPriceToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :current_price, :money, scope:2
  end
end
