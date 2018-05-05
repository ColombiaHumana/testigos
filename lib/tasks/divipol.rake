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
      post = Post.create(name: centro['puesto'], zone: zone, tables: centro['mesas'], mens: centro['hombres'], womens: centro['mujeres'], address: centro['direccion'], cod_post: centro['pp'])
    end
  end
end
