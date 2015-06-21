ActiveAdmin.register Order do
	menu label: 'Заказы'
	permit_params :status, :delivery_type, :phone,
								:address, :city, :country, :name, :special

	actions :show, :edit, :index, :update
	filter :name, label: 'Имя'
	filter :created_at, label: 'Дата'


	index do
		id_column
		column('Статус') {|order| status_tag(order.status)}
		column 'имя', :name
		column 'Дата', :created_at
		column('Покупатель') {|order| link_to order.user.email, admin_user_path(order.user) }
		column 'Доставка', :delivery_type
		column('Цена') {|order| number_to_currency order.total_price}
	end

	form do |f|
		f.inputs 'Изменить заказ' do
			f.input :name, label: 'Имя'
			f.input :status, as: :select,
			        label: 'Статус',
			        collection: Order.statuses.keys.to_a
			f.input :phone, label: 'Телефон'
			f.input :country, label: 'Страна', as: :string
			f.input :city, label: 'Город'
			f.input :address, label: 'Адрес'
			f.input :delivery_type, as: :select,
							label: 'Способ доставки',
							collection: Order.delivery_types.keys.to_a
		end
		f.actions
	end

	show do
		attributes_table do
			row :id
			row('Статус') {|order| order.status}
			row('Способ доставки') {|order| order.delivery_type}
			row('Дата') {|order| order.created_at}
			row('Покупатель') {|order| link_to "#{order.name}", admin_user_path(order.user) }
			row('Телефон') {|order| order.phone}
			row('Адрес') {|order|"#{order.country}-#{order.city} | #{order.address}"}
			row('Доп. описание') {|order| order.special}
		end

		panel 'Товары' do
			table_for(order.line_items) do |t|
				t.column('Продукт') {|item| auto_link item.product}
				t.column('Кол-во') {|item| item.quantity}
				t.column('Цена') {|item| number_to_currency item.total_price}
				tr :class => "odd" do
					td
					td "Общая цена:"
					td number_to_currency(order.total_price)
				end
			end
		end

		active_admin_comments
	end

end
