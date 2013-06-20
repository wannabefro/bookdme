class RemoveZipFromVenue < ActiveRecord::Migration
  def up
    remove_column :venues, :zipcode
  end

  def down
    add_column :venues, :zipcode, :integer
  end
end
