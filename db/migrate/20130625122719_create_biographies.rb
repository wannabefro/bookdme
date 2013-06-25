class CreateBiographies < ActiveRecord::Migration
  def change
    create_table :biographies do |t|
      t.integer :act_id, null: false
      t.text :biography
      t.text :rider

      t.timestamps
    end
  end
end
