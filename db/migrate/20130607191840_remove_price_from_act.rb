class RemovePriceFromAct < ActiveRecord::Migration
  def up
    remove_column :acts, :price
  end

  def down
    add_column :acts, :price, :integer
  end
end
