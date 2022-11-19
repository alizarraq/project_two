class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :title
      t.text :descreption
      t.integer :price
      t.string :location
      t.string :category

      t.timestamps
    end
  end
end
