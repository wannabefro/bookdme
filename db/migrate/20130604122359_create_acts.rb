class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.integer :user_id
      t.string :name
      t.integer :location_id
      t.integer :genre_id
      t.string :custom_genre
      t.text :biography
      t.string :website_url
      t.string :avatar
      t.integer :price
      t.text :rider
      t.integer :travel_range

      t.timestamps
    end
  end
end
