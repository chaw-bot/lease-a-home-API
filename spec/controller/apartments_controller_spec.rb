require 'rails_helper'
# :name, :image, :description, :maintenance_fee, :monthly_rent, :city,interior: []
RSpec.describe User, type: :feature do
  describe 'Apartment' do
    date = Date.civil(DateTime.now.year, DateTime.now.month, -1) - 1.month

    int_img = ['https://res.cloudinary.com/henrykc/image/upload/v1646145705/lease_a_home_app/num5/livingroom5_wbwi2a.jpg']

    img = 'https://res.cloudinary.com/henrykc/image/upload/v1646145705/lease_a_home_app/num5/apartment5_qhbttz.png'

    des = 'This is a modern house with full options. Classis bedrooms, kitchen, swimming pool and more.'

    # rubocop:disable Layout/LineLength
    subject do
      Apartment.create!(name: 'Farmhouse',
                        description: des, image: img, interior: int_img, maintenance_fee: 100, monthly_rent: 300, city: 'Jos', reservation_expiry_date: date)
    end

    # rubocop:enable Layout/LineLength
    it { is_expected.to have_attributes(name: 'Farmhouse') }

    it 'should validate apartment' do
      expect(subject).to be_valid
    end

    it 'should not be a valid apartment' do
      subject.name = nil
      subject.image = nil
      expect(subject).to_not be_valid
    end

    it 'shows the apartment\'s image' do
      expect(subject).to have_attributes(image: 'https://res.cloudinary.com/henrykc/image/upload/v1646145705/lease_a_home_app/num5/apartment5_qhbttz.png')
    end
  end
end
