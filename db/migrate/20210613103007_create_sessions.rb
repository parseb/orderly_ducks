class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      
      t.string :title
      t.datetime :s_time
      t.datetime :e_time
      t.text :agenda, array: true, default: []
      t.text :transcript
      t.text :state
      t.string :accesscode, precision: 6


      #t.references :user
      t.integer :created_by
      t.integer :moderator
      t.string :invited, array: true, default: []

      t.timestamps
    end
  end
end
