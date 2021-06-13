class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      
      t.string :title
      t.datetime :s_time
      t.datetime :e_time
      t.text :agenda
      t.text :transcript
      t.text :state
      t.string :accesscode
      t.references :user, index: true

      t.timestamps
    end
  end
end
