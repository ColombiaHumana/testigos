class Zone < ApplicationRecord
  belongs_to :municipality
  has_many :posts
end
