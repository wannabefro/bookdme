class RemoveTypeFromVenue < ActiveRecord::Migration
  def up
    remove_column :venues, :type
  end

  def down
    add_column :venues, :type, :string
  end
end
