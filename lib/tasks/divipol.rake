require 'csv'
namespace :divipol do
  desc "Load DIVIPOL CSV"
  task load: :environment do
    divipol_csv = File.read(Rails.root.join('vendor','divipol','divipol.csv'))
    csv = CSV.parse(divipol_csv, headers: true)
    csv.each do |centro|
      department = Department.where(cod_department: centro['dd'], name: centro['departamento']).first_or_create
      municipality = Municipality.where(cod_department: centro['dd'], name: centro['municipio'], cod_municipality: centro['mm'], department: department).first_or_create
      zone = Zone.where(name: centro['comuna'], municipality: municipality).first_or_create
      Post.create(name: centro['puesto'], zone: zone, tables: centro['mesas'], mens: centro['hombres'], womens: centro['mujeres'], address: centro['direccion'], cod_post: centro['pp'])
    end
  end

  desc 'Load witness data from file'
  task data: :environment do
    data_csv = File.read(Rails.root.join('vendor', 'divipol', 'data.csv'))
    csv = CSV.parse(data_csv, headers: true)
    csv.each do |witness|
      user = Witness.find_by(doc_number: witness['cedula'])
      puts witness.inspect
      unless user.nil? do
        user.attributes(
           checked: true,
           divipol: witness['divipol'],
           departamento: witness['departamento'],
           municipio: witness['municipio'],
           puesto: witness['puesto'],
           mesa: witness['mesa']
          )
        user.save(validate: false)
        end
      end
    end
  end
end
