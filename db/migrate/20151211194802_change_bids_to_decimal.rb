class ChangeBidsToDecimal < ActiveRecord::Migration
  def change
    remove_column :bids, :amount
    add_column :bids, :amount, :numeric, scale: 2
  end
end
