class Biography < ActiveRecord::Base

  attr_accessible :act, :biography, :rider

  validates_presence_of :act, :biography, :rider
  validate :one_biography, on: :create

  belongs_to :act

  private

  def one_biography
    if self.act.biographies.where(:biography => true).count >= 1
      errors[:max_biography] << 'You can only have 1 biography'
    end
  end

end
