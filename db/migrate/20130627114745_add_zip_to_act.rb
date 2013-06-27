class AddZipToAct < ActiveRecord::Migration
  def change
    add_column :acts, :zipcode, :string, null: false;
  end
end
