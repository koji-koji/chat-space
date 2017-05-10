class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text       :comment,null: false
      t.references :chatgroup_id
      t.references :user_id
      t.timestamps
    end
  end
end
