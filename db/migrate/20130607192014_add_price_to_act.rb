class AddPriceToAct < ActiveRecord::Migration
  def change
    add_column :acts, :price_id, :integer
  end
end
