class AddNullToProposal < ActiveRecord::Migration
  def up
    change_column :proposals, :act_id, :integer, null: false
    change_column :proposals, :user_id, :integer, null: false
  end

  def down
    change_column :proposals, :act_id, :integer
    change_column :proposals, :user_id, :integer
  end
end
