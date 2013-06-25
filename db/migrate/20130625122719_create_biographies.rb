class CreateBiographies < ActiveRecord::Migration
  def change
    create_table :biographies do |t|
      t.integer :act_id, null: false
      t.text :biography, null: false, default: 'Your biography goes here'
      t.text :rider, null: false, default: 'Your rider goes here'

      t.timestamps
    end
  end
end
