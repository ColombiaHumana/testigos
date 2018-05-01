class Zone < ApplicationRecord
  belongs_to :municipality
  has_many :posts

  def to_s
    self.name
  end
end
