class Department < ApplicationRecord
  has_many :municipalities

  def to_s
    self.name
  end
end
