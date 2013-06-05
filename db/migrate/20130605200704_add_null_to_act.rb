class AddNullToAct < ActiveRecord::Migration
  def up
    change_column :acts, :user_id, :integer, null: false
  end

  def down
    change_column :acts, :user_id, :integer, null: true
  end
end
