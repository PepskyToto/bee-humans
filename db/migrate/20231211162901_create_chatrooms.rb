class CreateChatrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :chatrooms do |t|
      t.references :helper, foreign_key: { to_table: 'users' }
      t.references :requete, foreign_key: { to_table: 'users' }
      t.integer :status

      t.timestamps
    end
  end
end
