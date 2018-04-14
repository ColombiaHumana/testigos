class AddRegDetailsToWitnesses < ActiveRecord::Migration[5.1]
  def change
    add_column :witnesses, :departamento, :string
    add_column :witnesses, :municipio, :string
    add_column :witnesses, :puesto, :string
    add_column :witnesses, :mesa, :string
    add_column :witnesses, :zona, :string
  end
end
