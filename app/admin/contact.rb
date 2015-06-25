ActiveAdmin.register Contact do
  menu label: 'Письма'

  permit_params :name, :email, :phone, :message

  filter :email
  filter :name, label:'Имя'
  index do
    column 'Дата', :created_at
    column :email
    column 'Телефон', :phone
    column 'Имя', :name
    column 'Сообщение' do |contact|
      contact.message.truncate(60)
    end

    actions
  end


end
