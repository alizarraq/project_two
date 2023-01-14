class AddUserIdToComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :worker_id, :user_id
  end
end
