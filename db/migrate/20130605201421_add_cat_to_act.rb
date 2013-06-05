class AddCatToAct < ActiveRecord::Migration
  def change
    add_column :acts, :category_id, :integer, null: false
  end
end
