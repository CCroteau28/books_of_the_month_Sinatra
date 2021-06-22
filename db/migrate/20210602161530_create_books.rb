class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.text :description
      t.boolean :popular
      t.string :book_month
      t.integer :user_id
    end
  end
end
