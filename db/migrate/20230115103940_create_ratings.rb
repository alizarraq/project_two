class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :rater_id
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
