class AddOrderToActiveOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :active_orders, :order_id, :integer
    add_column :active_orders, :title, :string
    add_column :active_orders, :descreption, :text
    add_column :active_orders, :price, :integer
    add_column :active_orders, :location, :string
    add_column :active_orders, :category, :string
    add_column :active_orders, :images, :string
    add_column :active_orders, :c_price, :integer
    add_column :active_orders, :date, :date
  end
end


