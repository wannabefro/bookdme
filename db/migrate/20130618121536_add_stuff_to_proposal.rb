class AddStuffToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :price, :integer, null: false
    add_column :proposals, :date, :datetime,  null: false
    add_column :proposals, :proposal, :text,  null: false
  end
end
