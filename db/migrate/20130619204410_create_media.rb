class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :url, null: false
      t.string :media_type, null: false
      t.integer :act_id, null: false

      t.timestamps
    end
  end
end
