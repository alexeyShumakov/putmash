ActiveAdmin.register User do
	menu label: 'Пользователи'
  permit_params :email, :name, :surname,
                :organization, :position,
                :birth_date, :gender
	actions :all, except: [:destroy, :new, :create]
  index do
    selectable_column
    id_column
    column :email
    column 'Имя', :name
    column 'Фамилия', :surname
    column 'Оргнизация', :organization
    column 'Должность', :position
    actions
  end

	show do
		attributes_table do
			row :id
			row :email
			row('Имя') {|user| "#{user.name} #{user.surname}"}
			row('Организация') {|user| user.organization}
			row('Должность') {|user| user.position}
			row('Дата рождения') {|user| user.birth_date}
			row('Пол') {|user| user.gender}
		end

		panel 'Заказы' do
			table_for(user.orders) do
				column('Заказ') {|order| link_to "##{order.id}", admin_order_path(order)}
				column('Статус'){|order| status_tag(order.status)}
				column('Дата') {|order| order.created_at}
				column('Сумма заказа') {|order| number_to_currency order.total_price}
			end

		end
		active_admin_comments
	end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :name, label: 'Имя'
	    f.input :surname, label: 'Фамилия'
	    f.input :organization, label: 'Организация'
	    f.input :position, label: 'Должность'
	    f.input :birth_date, label: 'Дата рождения'
	    f.input :gender, as: :select,
	            label: 'Пол',
		          collection: User.genders.keys.to_a
    end
    f.actions
  end
end
