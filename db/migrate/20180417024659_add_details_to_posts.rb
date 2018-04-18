class AddDetailsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :mens, :integer
    add_column :posts, :womens, :integer
    add_column :posts, :address, :string
    add_column :posts, :cod_post, :integer
    add_index :posts, :cod_post
    add_index :posts, :name
  end
end
