class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :customer_id
      t.integer :book_id
      t.text :review

      t.timestamps
    end
  end
end
