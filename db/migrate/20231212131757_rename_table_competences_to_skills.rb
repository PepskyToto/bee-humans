class RenameTableCompetencesToSkills < ActiveRecord::Migration[7.1]
  def change
    rename_table :competences, :skills
  end
end
