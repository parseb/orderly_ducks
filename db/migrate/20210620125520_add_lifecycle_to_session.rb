class AddLifecycleToSession < ActiveRecord::Migration[6.1]
  def change 
    change_table :sessions do |t|
    t.text :lifecycle, array: true
    end
  end
end
