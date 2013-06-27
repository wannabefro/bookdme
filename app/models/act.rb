
require 'obscenity/active_model'

class Act < ActiveRecord::Base
  include PgSearch


  attr_accessible :avatar, :custom_genre, :category_id, :location_id, :name, :price,
                  :travel_range, :user_id, :website, :short_bio, :price_id, :zipcode

  validates :name, presence: true, obscenity: { message: 'No obscenity allowed in the act name' }
  validates :category, presence: true
  validates :user, presence: true
  validates :location, presence: true
  validates :short_bio, presence: true, length: {maximum: 140}
  validates :price, presence: true
  validates :custom_genre, presence: true, length: {maximum: 50}
  validates :zipcode, presence: true
  validates_format_of :zipcode, :with => /^\d{5}(-\d{4})?$/, :message => "should be in the form 12345 or 12345-1234"


  belongs_to :user
  belongs_to :category
  belongs_to :location
  belongs_to :price

  has_many :proposals
  has_many :media_posts
  has_many :biographies
  has_many :reviews

  pg_search_scope :search, against: [:name, :custom_genre],
  associated_against: {location: :state, category: :name},
  using: [:trigram, :tsearch]


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
