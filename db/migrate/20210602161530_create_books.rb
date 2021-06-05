class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.string :rating
      t.integer :author_id
      t.integer :genre_id
      t.integer :user_id
    end
  end
end
