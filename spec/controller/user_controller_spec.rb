require 'rails_helper'

RSpec.describe User, type: :feature do
  describe 'User' do
    subject { User.create!(name: 'Henry', email: 'henry@gmail.com', password: 'henrykc') }

    it { is_expected.to have_attributes(name: 'Henry') }

    it 'should validate user' do
      expect(subject).to be_valid
    end

    it 'shows the user/s email' do
      expect(subject).to have_attributes(email: 'henry@gmail.com')
    end
  end
end
