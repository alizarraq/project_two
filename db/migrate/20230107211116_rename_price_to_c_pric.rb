class RenamePriceToCPric < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :c_price, :price

  end
end
