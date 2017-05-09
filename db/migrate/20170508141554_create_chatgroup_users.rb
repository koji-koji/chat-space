class CreateChatgroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :chatgroup_users do |t|
      t.references :user, foreign_key: true
      t.references :chatgroup, foreign_key: true
    end
  end
end
