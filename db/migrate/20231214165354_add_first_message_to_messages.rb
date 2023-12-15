class AddFirstMessageToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :first_message, :boolean, default: false
  end
end
