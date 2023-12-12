class AddFieldToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :address, :string
    add_column :users, :pollen, :integer, default: 1
    add_column :users, :average_rating, :integer
    add_column :users, :username, :string
  end
end
