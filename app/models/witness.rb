class Witness < ApplicationRecord
  validates_presence_of :doc_number, :first_name, :surname #, :departamento, :municipio, :puesto, :mesa #:municipality, :department
  # belongs_to :department
  # belongs_to :municipality
  validates :email, presence: true, email: true, length: { maximum: 25 }
  validates :phone, presence: true, numericality: { only_integer: true }, length: { in: 10..20}
  #validate :add_registraduria
  validates_uniqueness_of :doc_number, :phone, :email


  private
  def add_registraduria
    data = {
      cedula: self.doc_number,
      medioconsulta: "App",
      agente: "unknown",
      sistemaoperativo: "android",
      navegador: "cordova",
      dispositivo: "android",
      versionso: "7.0",
      versionnavegador: "5.1.1"
    }
    url = 'https://app.infovotantes.co/InfoVotantesWS/InfoServices/Servicios/consultarLugar'
    begin
      request = RestClient.post(url, data.to_json, {content_type: :json, accept: :json})
      json = JSON.parse(request)
      if json["exito"]
        if json["data"]["lugarVotacion"]
          vote_post = json["data"]["lugarVotacion"]
          self.departamento = vote_post["departamento"]
          self.municipio = vote_post["municipio"]
          self.puesto = vote_post["puesto"]
          self.mesa = vote_post["mesa"]
          self.zona = vote_post["codZona"]
          true
        elsif json["data"]["novedades"]
          self.errors.add(:doc_number, json["data"]["novedades"]["nombreNovedad"])
          false
        elsif json["exito"] == false
          self.errors.add(:doc_number, json["mensaje"].gsub(/<\/?[^>]*>/, ""))
          false
        end
      end
    rescue
      true
    end
  end
end
