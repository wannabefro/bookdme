class AddZipToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :zipcode, :string
  end
end
