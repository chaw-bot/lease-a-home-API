require 'rails_helper'

RSpec.describe Apartment, tyoe: :model do
    date = Date.civil(DateTime.now.year, DateTime.now.month, -1) - 1.month
    subject { Apartment.create!(name: 'Farmhouse', description: 'This is a modern house with full options. Classis bedrooms, kitchen, swimming pool and more.', image: 'https://res.cloudinary.com/henrykc/image/upload/v1646145705/lease_a_home_app/num5/apartment5_qhbttz.png', interior: ['https://res.cloudinary.com/henrykc/image/upload/v1646145705/lease_a_home_app/num5/livingroom5_wbwi2a.jpg', 'https://res.cloudinary.com/henrykc/image/upload/v1646145704/lease_a_home_app/num5/bedroom5_w8tt48.jpg', 'https://res.cloudinary.com/henrykc/image/upload/v1646145704/lease_a_home_app/num5/bathroom5_epgjaz.png'], maintenance_fee: 100, monthly_rent: 300, city: 'Jos', reservation_expiry_date: date) }

  before { subject.save }

  it 'should validate apartment' do
    expect(subject).to be_valid
  end

  it 'should not be a valid apartment' do
    subject.name = nil
    subject.image = nil
    expect(subject).to_not be_valid
  end
end
