ActiveAdmin.register Witness do
  actions :index, :show
  index do
    column :doc_number
    column :first_name
    column :second_name
    column :surname
    column :second_surname
    column :email
    column :phone
    column :departamento
    column :municipio
    column :puesto
    column :mesa
    column :zona
    column :has_smartphone
    column :foreing
  end

  csv do
    column :doc_number
    column :first_name
    column :second_name
    column :surname
    column :second_surname
    column :email
    column :phone
    column :departamento
    column :department
    column :municipio
    column :municipality
    column :zona
    column :zone
    column :puesto
    column :post
    column :mesa
    column :has_smartphone
    column :foreing
    column :created_at
  end
end
