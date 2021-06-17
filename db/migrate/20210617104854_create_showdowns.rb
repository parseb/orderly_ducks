class CreateShowdowns < ActiveRecord::Migration[6.1]
  def change
    create_table :showdowns do |t|
      t.text :q
      t.text :temp_transcript
      t.text :meta
      t.string :state1
      t.string :state2
      t.string :state3
      t.text :chat
      t.belongs_to :session, null: false, foreign_key: true
      t.text :present 

      t.timestamps
    end
  end
end
