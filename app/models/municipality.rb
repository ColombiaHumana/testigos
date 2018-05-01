class Municipality < ApplicationRecord
  belongs_to :department
  has_many :zones

  def to_s
    self.name
  end
end
