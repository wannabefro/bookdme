
require 'obscenity/active_model'
require 'carrierwave/orm/activerecord'

class Act < ActiveRecord::Base
  include PgSearch
  mount_uploader :avatar, AvatarUploader

  attr_accessible :avatar, :biography, :custom_genre, :category_id, :location_id, :name, :price, :rider,
                  :travel_range, :user_id, :website, :avatar_cache, :short_bio, :price_id, :remove_avatar

  validates :name, presence: true, obscenity: { message: 'No obscenity allowed in the act name' }
  validates :category, presence: true
  validates :user, presence: true
  validates :location, presence: true
  validates :short_bio, presence: true, length: {maximum: 140}
  validates :price, presence: true
  validates :custom_genre, presence: true, length: {maximum: 50}


  belongs_to :user
  belongs_to :category
  belongs_to :location
  belongs_to :price

  has_many :proposals

  pg_search_scope :search, against: [:name, :custom_genre],
  associated_against: {location: :state, category: :name}
  # , comments: [:name, :content]},

  def owner? current_user
    user == current_user
  end

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end



end
