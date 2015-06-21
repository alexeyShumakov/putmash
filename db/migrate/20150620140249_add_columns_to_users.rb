class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :surname, :string
    add_column :users, :organization, :string
    add_column :users, :position, :string
    add_column :users, :birth_date, :datetime
    add_column :users, :gender, :integer
  end
end
