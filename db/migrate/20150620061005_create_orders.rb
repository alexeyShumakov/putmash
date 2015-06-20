class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :status, default: 0, null: false
      t.references :user, index: true, foreign_key: true
      t.integer :delivery_type
      t.string :phone
      t.string :address
      t.string :city
      t.string :country
      t.string :name
      t.text :special

      t.timestamps null: false
    end
  end
end
