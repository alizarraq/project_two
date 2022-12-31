class RemovecategoryFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :category, :string
  end
end
