class AddIndexToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :user_name, :string, index: true, null: false
  end
end
