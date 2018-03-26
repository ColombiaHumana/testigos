class Witness < ApplicationRecord
  validates_presence_of :doc_number, :first_name, :surname, :phone, :email, :municipality, :department
  belongs_to :department
  belongs_to :municipality
end
