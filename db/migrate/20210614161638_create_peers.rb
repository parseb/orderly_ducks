class CreatePeers < ActiveRecord::Migration[6.1]
  def change
    create_table :peers do |t|

      t.belongs_to :user
      
      t.string :email
      t.string :phone
      t.string :name 
      t.string :label

      t.timestamps
    end
  end
end
