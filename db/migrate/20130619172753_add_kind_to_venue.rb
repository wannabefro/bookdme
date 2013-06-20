class AddKindToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :kind, :string
  end
end
