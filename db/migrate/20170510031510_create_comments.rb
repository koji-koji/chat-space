class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text       :comment,null: false
      t.references :chatgroup
      t.references :user
      t.timestamps
    end
  end
end
