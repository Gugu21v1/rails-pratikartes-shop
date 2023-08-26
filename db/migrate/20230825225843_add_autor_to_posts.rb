class AddAutorToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :autor, :string
  end
end
