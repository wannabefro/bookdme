class AddDateToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :date, :date, null: false
    add_column :proposals, :time, :time, null: false
  end
end
