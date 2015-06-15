class CreateValutes < ActiveRecord::Migration
  def change
    create_table :valutes do |t|
      t.decimal :gbp, precision: 8, scale: 4
      t.decimal :usd, precision: 8, scale: 4
      t.decimal :eur, precision: 8, scale: 4

      t.timestamps null: false
    end
  end
end
