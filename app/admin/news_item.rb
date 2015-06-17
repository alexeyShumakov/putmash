ActiveAdmin.register NewsItem do

	permit_params :title, :body, :image

	form :html => { :enctype => "multipart/form-data" } do |f|
		f.inputs do
			f.input :title
			f.input :body
			f.input :image, as: :file, label: "Image",
			  hint: image_tag(f.object.image.url(:thumb))
		end
		actions
	end
end
