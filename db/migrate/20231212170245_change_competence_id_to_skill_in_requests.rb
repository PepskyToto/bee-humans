class ChangeCompetenceIdToSkillIdInRequests < ActiveRecord::Migration[7.1]
  def change
    if column_exists?(:requests, :competence_id)
      rename_column :requests, :competence_id, :skill_id
    end
  end
end
