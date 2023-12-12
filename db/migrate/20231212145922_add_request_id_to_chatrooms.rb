class AddRequestIdToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :chatrooms, :request_id, :bigint
    add_index :chatrooms, :request_id
    add_foreign_key :chatrooms, :requests, column: :request_id
  end
end
