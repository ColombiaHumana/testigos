class AddElectorDetailsToWitnesses < ActiveRecord::Migration[5.1]
  def change
    add_reference :witnesses, :zone, foreign_key: true
    add_reference :witnesses, :post, foreign_key: true
    add_column :witnesses, :table, :integer
  end
end
