class CreateReviews < ActiveRecord::Migration[7.1]
  def change
      create_table :reviews do |t|
        t.integer :rating
        t.text :description
        t.references :reviewer, foreign_key: { to_table: :users } # Il devrait référencer la table "users"
        t.references :user, foreign_key: true

        t.timestamps
    end
  end
end
