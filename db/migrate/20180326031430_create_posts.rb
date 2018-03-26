class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.references :zone, foreign_key: true
      t.integer :tables

      t.timestamps
    end
    add_index :posts, :tables
  end
end
