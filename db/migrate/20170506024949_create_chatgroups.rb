class CreateChatgroups < ActiveRecord::Migration[5.0]
  def change
    create_table :chatgroups do |t|
      t.string :group_name,null: false, unique: true
      t.timestamps
    end
  end
end
