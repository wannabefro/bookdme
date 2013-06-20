class AddNameToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :name, :string, null: false
  end
end
