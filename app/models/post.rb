class Post < ApplicationRecord
  belongs_to :zone

  def to_s
    self.name
  end
end
