class CreateChatgroups < ActiveRecord::Migration[5.0]
  def change
    create_table :chatgroups do |t|

      t.timestamps
    end
  end
end
