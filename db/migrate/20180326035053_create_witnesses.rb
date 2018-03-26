class CreateWitnesses < ActiveRecord::Migration[5.1]
  def change
    create_table :witnesses do |t|
      t.integer :doc_number
      t.string :first_name
      t.string :second_name
      t.string :surname
      t.string :second_surname
      t.boolean :has_smartphone
      t.string :phone
      t.string :email
      t.boolean :foreing
      t.references :department, foreign_key: true
      t.references :municipality, foreign_key: true

      t.timestamps
    end
  end
end
