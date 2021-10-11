class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :genre_id
      t.text :synopsis
      t.string :image_id

      t.timestamps
    end
  end
end
