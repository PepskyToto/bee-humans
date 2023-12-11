class CreateChatrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :chatrooms do |t|
      t.references :helper, null: false, foreign_key: true
      t.references :requete, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
