ActiveAdmin.register Product do

	permit_params :article, :description, :name, :price, :first_image, :second_image,
	              :category_id, :featured,
								:additional_descriptions_attributes => [:id, :name, :value, :product_id, :_destroy]
	index do
		selectable_column
		id_column
		column :article
		column :name
		column :price do |price|
			number_to_currency(price.price)
		end
		actions
	end
	form :html => { :enctype => "multipart/form-data" } do |f|
		f.inputs do
			f.input :name
			f.input :article
			f.input :featured, label: 'Опубилкован'
			f.input :price
			f.input :description
			f.input :first_image, as: :file, label: "Первое изображение",
			        hint: image_tag(f.object.first_image.url(:thumb))
			f.input :second_image, as: :file, label: "Второе изображение",
			        hint: image_tag(f.object.second_image.url(:thumb))
			f.has_many :additional_descriptions, allow_destroy: true do |ad|
				ad.input :name
				ad.input :value
			end
		end
		actions
	end

end
