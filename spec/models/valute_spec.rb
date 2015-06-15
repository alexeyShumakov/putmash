require 'rails_helper'

RSpec.describe Valute, type: :model do
	describe 'validation tests' do
		it 'valid' do
			valute = build(:valute)
			expect(valute).to be_valid
		end

		it 'invalid(sting)' do
			valute = build(:invalid_valute)
			expect(valute).not_to be_valid
		end

	end
end
