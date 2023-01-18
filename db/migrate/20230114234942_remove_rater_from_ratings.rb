class RemoveRaterFromRatings < ActiveRecord::Migration[7.0]
  def change
    drop_table :rates
  end
end
