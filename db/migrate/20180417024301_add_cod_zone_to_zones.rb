class AddCodZoneToZones < ActiveRecord::Migration[5.1]
  def change
    add_column :zones, :cod_zone, :integer
    add_index :zones, :cod_zone
  end
end
