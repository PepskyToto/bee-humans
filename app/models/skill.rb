class ChangeCompetenceToSkillInRequests < ActiveRecord::Migration[7.1]
  def change
    remove_column :requests, :competence_id, :bigint
    add_column :requests, :skill_id, :bigint
    add_index :requests, :skill_id
    add_foreign_key :requests, :skills, column: :skill_id
  end
end
