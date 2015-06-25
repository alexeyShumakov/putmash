ActiveAdmin.register Category do
  menu label: 'Категории'
  permit_params :title, :name

  member_action :edit do
    @page_title = "Изменить категорию"
  end

  filter :title, label: 'Заголовок'
  filter :name, label: 'Название'

  index title: 'Категории' do
    id_column
    column 'Заголовок', :title
    column 'Название', :name
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
      row('Заголовок') {|cat| cat.title}
      row('Название') {|cat| cat.name}
    end
    active_admin_comments
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
