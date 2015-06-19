ActiveAdmin.register Category do
	menu label: 'Категории'
	permit_params :title, :name

  member_action :edit do
    @page_title = "Изменить категорию"
  end
	index title: 'Категории'

	filter :title, label: 'Заголовок'
	filter :name, label: 'Название'

	index do
		id_column
		column 'Заголовок', :title
		column 'Название', :value
		actions
	end

	form do |f|
		f.inputs do
			f.input :title, label: 'Заголовок'
			f.input :name, label: 'Название'
		end
		actions
	end

	show do
		attributes_table do
			row :title, label: 'Заголовок'
			row :name, label: 'Название'
		end
	end

	member_action :destroy, method: :delete do
		category = Category.find(params[:id])
		if category.products.any?
			redirect_to admin_categories_path, notice: "В категории есть товары. Нельзя удалить."
		else
			category.destroy
			redirect_to admin_categories_path, notice: "Категория удалена."
		end

	end
end
