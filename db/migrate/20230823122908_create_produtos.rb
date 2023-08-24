class CreateProdutos < ActiveRecord::Migration[7.0]
  def change
    create_table :produtos do |t|
      t.string :tipo_produto
      t.string :tipo_curso
      t.string :nome
      t.string :foto
      t.string :valor
      t.string :modulos
      t.string :autor

      t.timestamps
    end
  end
end
