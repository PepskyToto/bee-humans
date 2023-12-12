class RenameColumnInUsersSkills < ActiveRecord::Migration[7.1]
  def change
    rename_column :users_skills, :competence_id, :skill_id
  end
end
