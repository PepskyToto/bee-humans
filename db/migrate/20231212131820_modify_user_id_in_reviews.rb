class ModifyUserIdInReviews < ActiveRecord::Migration[7.1]
  def change
    rename_column :reviews, :user_id, :reviewee_id
  end
end
