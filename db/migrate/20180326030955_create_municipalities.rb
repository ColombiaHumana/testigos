class CreateMunicipalities < ActiveRecord::Migration[5.1]
  def change
    create_table :municipalities do |t|
      t.string :name
      t.integer :cod_department
      t.integer :cod_municipality
      t.references :department, foreign_key: true

      t.timestamps
    end
    add_index :municipalities, :cod_department
    add_index :municipalities, :cod_municipality
  end
end
