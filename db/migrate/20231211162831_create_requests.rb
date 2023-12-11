class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.text :description
      t.string :title
      t.references :competence, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.string :address

      t.timestamps
    end
  end
end
