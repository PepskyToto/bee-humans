class ChangeAverageRatingToFloat < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :average_rating, :float
  end
end
