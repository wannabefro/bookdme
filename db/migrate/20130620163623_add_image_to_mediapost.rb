class AddImageToMediapost < ActiveRecord::Migration
  def change
    add_column :media_posts, :image, :string
  end
end
