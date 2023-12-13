class ChangeCompetenceIdToSkillIdInRequests < ActiveRecord::Migration[7.1]
    def change
      rename_column :requests, :competence_id, :skill_id
    end
  end
