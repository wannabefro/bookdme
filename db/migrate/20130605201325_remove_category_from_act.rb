class RemoveCategoryFromAct < ActiveRecord::Migration
  def up
    remove_column :acts, :category_id
  end

  def down
    add_column :acts, :category_id, :string
  end
end
