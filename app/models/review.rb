class Review < ActiveRecord::Base

  before_validation :max_reviews

  attr_accessible :headline, :review, :source, :act

  validates_presence_of :headline, :review, :act
  belongs_to :act, dependent: :destroy

  private

  def max_reviews
    if self.act.reviews.count >= 3
      errors[:max_reviews] << 'You can only have 3 reviews'
    end
  end
end
