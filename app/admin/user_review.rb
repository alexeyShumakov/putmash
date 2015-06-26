ActiveAdmin.register UserReview do
  menu label: 'Отзывы'
  permit_params :body, :moderated

  filter :user, label: 'Пользователь'
  filter :body, label: 'Отзыв'

  index title: 'Отзывы' do
    id_column
    column 'Пользователь', :user
    column 'Отзыв', :body
    column 'Проверено?', :moderated
    actions
  end

end
