class AddActurlToMediaPost < ActiveRecord::Migration
  def change
    add_column :media_posts, :act_url, :string
  end
end
