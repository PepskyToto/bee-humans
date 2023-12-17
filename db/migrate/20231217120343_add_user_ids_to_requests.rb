class AddUserIdsToRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :requests, :user_ids, :integer, array: true, default: []
  end
end
