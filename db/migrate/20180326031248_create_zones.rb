class CreateZones < ActiveRecord::Migration[5.1]
  def change
    create_table :zones do |t|
      t.string :name
      t.references :municipality, foreign_key: true

      t.timestamps
    end
  end
end
