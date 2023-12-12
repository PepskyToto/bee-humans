class RenameRequestIdToNeederIdInChatrooms < ActiveRecord::Migration[7.1]
  def change
    rename_column :chatrooms, :request_id, :needer_id
  end
end
