ActiveAdmin.register Product do
	menu label: 'Продукция'
	permit_params :article, :description, :name, :price, :first_image, :second_image,
	              :category_id, :featured,
								:additional_descriptions_attributes => [:id, :name, :value, :product_id, :_destroy]
	filter :article
	filter :name
	index do
		selectable_column
		id_column
		column'Артикул', :article
		column 'Имя', :name
		column 'Дата создания', :created_at
		column 'Цена', :price do |price|
			number_to_currency(price.price)
		end
		actions
	end

	show do
		attributes_table do
			row('Артикул') {|prod| prod.article}
			row('Название') {|prod| prod.name}
			row('Цена') {|prod| prod.price}
			row('Публикация') {|prod|prod.featured ? 'Да':'Нет'}
			row('Описание') {|prod| prod.description}
			row('Категория') {|prod| link_to prod.category.name, admin_category_path(prod.category) }
			row('1 изображение') {|prod| image_tag prod.first_image.url(:small)}
			row('2 изображение') {|prod| image_tag prod.second_image.url(:small)}
		end
		panel 'Доп. описание' do
			table_for(product.additional_descriptions) do |ad|
				column 'Название', :name
				column 'Значение', :value

			end
		end
		active_admin_comments
	end
	form :html => { :enctype => "multipart/form-data" } do |f|
		f.inputs do
			f.input :name, label: 'Имя'
			f.input :article, label: 'Артикул'
			f.input :featured, label: 'Опубилкован'
			f.input :price, label: 'Цена'
			f.input :description, label: 'Описание'
			f.input :first_image, as: :file, label: "Первое изображение(используйте 500x435px)",
			        hint: image_tag(f.object.first_image.url(:small))
			f.input :second_image, as: :file, label: "Второе изображение(используйте 500x435px)",
			        hint: image_tag(f.object.second_image.url(:small))
			f.has_many :additional_descriptions, heading: 'Доп.описание', allow_destroy: true do |ad|
				ad.input :name, label:'Название'
				ad.input :value, label: 'Значение'
			end
		end
		actions
	end

end
