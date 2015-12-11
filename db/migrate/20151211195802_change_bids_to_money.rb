class ChangeBidsToMoney < ActiveRecord::Migration
  def change
    remove_column :bids, :amount
    add_column :bids, :amount, :money, scale: 2
  end
end
