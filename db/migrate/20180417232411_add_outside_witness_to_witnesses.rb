class AddOutsideWitnessToWitnesses < ActiveRecord::Migration[5.1]
  def change
    add_column :witnesses, :outside_witness, :boolean
  end
end
