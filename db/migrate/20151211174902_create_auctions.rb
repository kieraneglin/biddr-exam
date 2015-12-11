class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :body
      t.string :end_time
      t.string :reserve

      t.timestamps null: false
    end
  end
end
