class CreateOrderCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :order_categories do |t|
      t.integer :order_id
      t.integer :category_id
      t.timestamps
    end
  end
end
