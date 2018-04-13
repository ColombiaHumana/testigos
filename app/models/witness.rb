class Witness < ApplicationRecord
  validates_presence_of :doc_number, :first_name, :surname, :phone, :email #, :departamento, :municipio, :puesto, :mesa #:municipality, :department
  # belongs_to :department
  # belongs_to :municipality
  validate :add_registraduria
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
      end

    end
  end
end
