class AddCategoryToAct < ActiveRecord::Migration
  def change
    add_column :acts, :category_id, :string
  end
end
