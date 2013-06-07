class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :range

      t.timestamps
    end
  end
end
