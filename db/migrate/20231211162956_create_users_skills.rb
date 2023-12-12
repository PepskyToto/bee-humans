class CreateUsersSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :users_skills do |t|
      t.references :user, null: false, foreign_key: true
      t.references :competence, null: false, foreign_key: true
      t.timestamps
    end
  end
end
