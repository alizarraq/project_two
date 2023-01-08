class RenamePriceToCPrice < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :price, :c_price
    change_column :comments, :c_price, :integer
  end
end
