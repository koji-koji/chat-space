class RenameUserNameToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :user_name, :name
  end
end
