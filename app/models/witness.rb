class Witness < ApplicationRecord
  validates_presence_of :doc_number, :first_name, :surname #, :departamento, :municipio, :puesto, :mesa #:municipality, :department
  belongs_to :department, required: false
  belongs_to :municipality, required: false
  belongs_to :zone, required: false
  belongs_to :post, required: false
  validates :doc_number, presence: true, length: { maximum: 10 }
  validates :email, presence: true, email: true, length: { maximum: 40 }
  validates :phone, presence: true, numericality: { only_integer: true }, length: { in: 10..20}
  #validate :add_registraduria
  validates_uniqueness_of :doc_number, :phone, :email
  validate :outside_witness

  private

  def outside_witness
    if self.outside_witness?
      errors.add(:department_id, "no puede estar vacío") unless !self.department.nil?
      errors.add(:municipality_id, "no puede estar vacío") unless !self.municipality.nil?
      errors.add(:zone_id, "no puede estar vacío") unless !self.zone.nil?
      errors.add(:post_id, "no puede estar vacío") unless !self.post.nil?
    end
  end
end
