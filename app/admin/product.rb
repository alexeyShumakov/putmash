ActiveAdmin.register Product do

	permit_params :article, :description, :name, :price, :first_image, :second_image


	form :html => { :enctype => "multipart/form-data" } do |f|
		f.inputs do
			f.input :name
			f.input :article
			f.input :price
			f.input :description
			f.input :first_image, as: :file, label: "Первое изображение",
			        hint: image_tag(f.object.first_image.url(:thumb))
			f.input :second_image, as: :file, label: "Второе изображение",
			        hint: image_tag(f.object.second_image.url(:thumb))
		end
		actions
	end

end
