class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.string :data
      t.string :img_url

      t.timestamps
    end
  end
end
