class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.decimal :price, precision: 9, scale: 2
      t.string :name
      t.text :description
      t.string :article
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
