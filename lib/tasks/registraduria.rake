namespace :registraduria do
  desc "Load missing registraduria data"
  task :find do
    url = 'https://app.infovotantes.co/InfoVotantesWS/InfoServices/Servicios/consultarLugar'
    data = {
      medioconsulta: "App",
      agente: "unknown",
      sistemaoperativo: "android",
      navegador: "cordova",
      dispositivo: "android",
      versionso: "7.0",
      versionnavegador: "5.1.1"
    }
    Witness.where(departamento: nil).each do | witness |
      puts "trying with #{witness.doc_number}"
      data.merge!({ cedula: witness.doc_number })
      begin
        puts "loading endpoint"
        response = RestClient.post(url, data.to_json, {content_type: :json, accept: :json})
        if response.code == 200
          puts "OK, reading JSON"
          json = JSON.parse(response)
          witness.update(departamento: data["departamento"],
                         municipio: data["municipio"],
                         puesto: vote_post["puesto"],
                         mesa: data["mesa"],
                         zona: data["codZona"]) unless json["data"]["lugarVotacion"] == nil
        end
      rescue
        next
      end
    end
  end
end
