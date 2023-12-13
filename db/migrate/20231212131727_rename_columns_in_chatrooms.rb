class RenameColumnsInChatrooms < ActiveRecord::Migration[7.1]
  def change
    rename_column :chatrooms, :requete_id, :request_id
  end
end
