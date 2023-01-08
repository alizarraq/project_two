class CreateActiveOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :active_orders do |t|
      t.integer :user_id
      t.integer :worker_id
      t.timestamps
    end
  end
end
