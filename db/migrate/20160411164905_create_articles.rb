class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body
      t.string :contact, null: false
      t.decimal :price, default: 0.00
      t.integer :category_id
      t.string :location
      t.string :hash_key, null: false

      t.timestamps null: false
    end
  end
end
