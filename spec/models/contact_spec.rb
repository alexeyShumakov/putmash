require 'rails_helper'

RSpec.describe Contact, type: :model do
	describe 'validation test' do
		it 'should be valid' do
			contact = build(:contact)
			expect(contact).to be_valid
		end

		it 'should not be valid' do
			contact = build(:invalid_contact)
			expect(contact).not_to be_valid
		end
	end
end
