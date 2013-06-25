class RemoveBioFromAct < ActiveRecord::Migration
  def up
    remove_column :acts, :biography
    remove_column :acts, :rider
  end

  def down
    add_column :acts, :rider, :string
    add_column :acts, :biography, :string
  end
end
