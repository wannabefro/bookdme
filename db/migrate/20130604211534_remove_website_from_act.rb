class RemoveWebsiteFromAct < ActiveRecord::Migration
  def up
    remove_column :acts, :website_url
  end

  def down
    add_column :acts, :website_url, :string
  end
end
