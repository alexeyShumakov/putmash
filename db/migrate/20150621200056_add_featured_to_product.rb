class AddFeaturedToProduct < ActiveRecord::Migration
  def change
    add_column :products, :featured, :boolean, default: true
  end
end
