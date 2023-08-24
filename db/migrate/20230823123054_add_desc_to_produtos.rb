class AddDescToProdutos < ActiveRecord::Migration[7.0]
  def change
    add_column :produtos, :desc, :text
  end
end
