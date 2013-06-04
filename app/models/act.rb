require 'obscenity/active_model'

class Act < ActiveRecord::Base

  attr_accessible :avatar, :biography, :custom_genre, :genre_id, :location_id, :name, :price, :rider, :travel_range, :user_id, :website_url

  validates :name, presence: true, obscenity: { message: 'No obscenity allowed in the act name' }

  belongs_to :user

  def owner? current_user
    user == current_user
  end

end
