class AddImagesToProducts < ActiveRecord::Migration
	def up
    add_attachment :products, :first_image
    add_attachment :products, :second_image
  end

  def down
    remove_attachment :products, :first_image
    remove_attachment :products, :second_image
  end
end
