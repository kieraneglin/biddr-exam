class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :details
      t.string :end
      t.string :reserve

      t.timestamps null: false
    end
  end
end
