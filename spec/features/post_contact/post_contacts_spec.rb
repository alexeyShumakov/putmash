feature 'Post contact' do
	scenario 'Visit contacts/new page, create with valid data' do
		contact = build(:contact)
		visit 'contacts/new'
		expect(page).to have_content 'Свяжитесь с нами'
		expect {
		fill_in 'contact_email', with: contact.email
		fill_in 'contact_name', with: contact.name
		fill_in 'contact_phone', with: contact.phone
		fill_in 'contact_message', with: contact.message
		click_button 'Отправить'
		}.to change(Contact, :count).by(1)
		expect(current_path).to eq root_path
		expect(page).to have_content 'Спасибо за обращение, скоро мы с вами свяжемся.'

	end

	scenario 'Visit contacts/new page, create with invalid data' do
		contact = build(:invalid_contact)
		visit 'contacts/new'
		expect(page).to have_content 'Свяжитесь с нами'

		fill_in 'contact_email', with: contact.email
		fill_in 'contact_name', with: contact.name
		fill_in 'contact_phone', with: contact.phone
		fill_in 'contact_message', with: contact.message
		click_button 'Отправить'

		expect(current_path).to eq contacts_path
		expect(page).to have_content 'Исправьте ошибки, пожалуйста:'

	end
end