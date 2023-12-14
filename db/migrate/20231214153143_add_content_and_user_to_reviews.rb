class AddContentAndUserToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :content, :string
  end
end
