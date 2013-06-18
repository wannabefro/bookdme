class AddIndexToAct < ActiveRecord::Migration
  def change
    add_index :acts, :user_id, :unique => true
  end
end
