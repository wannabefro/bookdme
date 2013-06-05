
require 'obscenity/active_model'
require 'carrierwave/orm/activerecord'

class Act < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  attr_accessible :avatar, :biography, :custom_genre, :category_id, :location_id, :name, :price, :rider,
                  :travel_range, :user_id, :website, :avatar_cache

  validates :name, presence: true, obscenity: { message: 'No obscenity allowed in the act name' }
  validates :category, presence: true

  belongs_to :user
  belongs_to :category
  belongs_to :location

  def owner? current_user
    user == current_user
  end


end
