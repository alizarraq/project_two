class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :order_id
      t.integer :worker_id
      t.text :content
      t.decimal :price
      t.date :date
      t.string :status

      t.timestamps
    end
  end
end
