class AddWebsiteToAct < ActiveRecord::Migration
  def change
    add_column :acts, :website, :string
  end
end
