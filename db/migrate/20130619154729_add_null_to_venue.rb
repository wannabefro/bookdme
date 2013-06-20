class AddNullToVenue < ActiveRecord::Migration
  def change
    change_column :venues, :user_id, :integer, null: false
    change_column :venues, :location_id, :integer, null: false
  end
end
