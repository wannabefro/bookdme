class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :headline, null: false
      t.text :review, null: false
      t.string :source
      t.integer :act_id, null: false

      t.timestamps
    end
  end
end
