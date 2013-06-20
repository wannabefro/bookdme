class AddVenueToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :venue_id, :integer
  end
end
