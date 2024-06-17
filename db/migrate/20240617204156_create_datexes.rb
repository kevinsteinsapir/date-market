class CreateDatexes < ActiveRecord::Migration[7.1]
  def change
    create_table :datexes do |t|
      t.string :title
      t.text :content
      t.boolean :visibility
      t.string :address
      t.integer :price
      t.integer :guests
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
