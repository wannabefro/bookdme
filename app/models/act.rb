class Act < ActiveRecord::Base
  attr_accessible :avatar, :biography, :custom_genre, :genre_id, :location_id, :name, :price, :rider, :travel_range, :user_id, :website_url
end
