ActiveAdmin.register NewsItem do
	menu label: 'Новости'
	permit_params :title, :body, :image
	filter :title, label: 'Заголовок'
	index do
		column 'Заголовок', :title
		column 'Дата', :created_at
		actions
	end
	show do
		attributes_table do
			row('Дата') {|n| n.created_at}
			row('Заголовок') {|n| n.title}
			row('Новость') {|n| n.body}
		end
		active_admin_comments
	end
	form :html => { :enctype => "multipart/form-data" } do |f|
		f.inputs do
			f.input :title, label: 'Заголовок'
			f.input :body, 'Новость'
			f.input :image, as: :file, label: "Изображение(используйте 1400x300px) ",
			  hint: image_tag(f.object.image.url(:thumb))
		end
		actions
	end
end
