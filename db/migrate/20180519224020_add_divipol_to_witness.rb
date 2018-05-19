class AddDivipolToWitness < ActiveRecord::Migration[5.1]
  def change
    add_column :witnesses, :divipol, :string
    add_index :witnesses, :divipol
    add_column :witnesses, :checked, :boolean
    add_column :witnesses, :verified, :boolean
  end
end
