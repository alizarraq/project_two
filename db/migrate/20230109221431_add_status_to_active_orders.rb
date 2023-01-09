class AddStatusToActiveOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :active_orders, :status, :string, default: "active"
  end
end
