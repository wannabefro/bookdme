class AddTypeToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :type, :string, null: false
    add_column :venues, :capacity, :integer, null: false
    add_column :venues, :city, :string, null: false
    add_column :venues, :zipcode, :integer, null: false
  end
end
