class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :act_id
      t.integer :user_id

      t.timestamps
    end
  end
end
