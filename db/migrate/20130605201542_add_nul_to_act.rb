class AddNulToAct < ActiveRecord::Migration
  def up
    change_column :acts, :location_id, :integer, null: false
  end

  def down
    change_column :acts, :category_id, :integer, null: true
  end
end
