class SetDefaultCurrentPrice < ActiveRecord::Migration
  def change
    change_column :auctions, :current_price, :money, scale: 2, default: 0 
  end
end
