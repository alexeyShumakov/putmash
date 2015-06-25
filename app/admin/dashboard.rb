ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do

      column do
        panel 'Последние заказы' do
          table_for Order.order('created_at desc').limit(10) do
            column('#') {|order| link_to order.id, admin_order_path(order)}
            column('Статус') {|order| status_tag(order.status)}
            column('Покупатель') {|order| link_to order.user.email, admin_user_path(order.user)}
            column('Сумма заказа') {|order| number_to_currency order.total_price}
          end
        end
      end

      column do
        panel 'Последние пользователи' do
          table_for User.order('created_at desc').limit(10) do
            column('Имя') {|user| "#{user.name} #{user.surname}"}
            column('email') {|user| link_to user.email, admin_user_path(user)}
            column('Организация') {|user| user.organization}
            column('Должность') {|user| user.position}
          end
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
