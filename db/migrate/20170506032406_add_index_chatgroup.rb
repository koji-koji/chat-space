class AddIndexChatgroup < ActiveRecord::Migration[5.0]
  def change
    add_index :chatgroups, :group_name, unique: true
  end
end
