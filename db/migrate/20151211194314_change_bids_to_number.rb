class ChangeBidsToNumber < ActiveRecord::Migration
  def change
    remove_column :bids, :amount
    add_column :bids, :amount, :float
  end
end
