require 'rails_helper'

RSpec.describe Apartment, tyoe: :model do
  date = Date.civil(DateTime.now.year, DateTime.now.month, -1) - 1.month

  int_img = ['https://res.cloudinary.com/henrykc/image/upload/v1646145705/lease_a_home_app/num5/livingroom5_wbwi2a.jpg']

  img = 'https://res.cloudinary.com/henrykc/image/upload/v1646145705/lease_a_home_app/num5/apartment5_qhbttz.png'

  des = 'This is a modern house with full options. Classis bedrooms, kitchen, swimming pool and more.'

  # rubocop:disable Layout/LineLength
  subject do
    Apartment.create!(name: 'Farmhouse',
                      description: des, image: img, interior: int_img, maintenance_fee: 100, monthly_rent: 300, city: 'Jos', reservation_expiry_date: date)
  end
  before { subject.save }
  # rubocop:enable Layout/LineLength

  it 'should validate apartment' do
    expect(subject).to be_valid
  end

  it 'should not be a valid apartment' do
    subject.name = nil
    subject.image = nil
    expect(subject).to_not be_valid
  end

  it 'should display apartment image' do
    expect(subject.image).to eq(img)
  end

  it 'should display apartment description' do
    expect(subject.description).to eq(des)
  end
  
end
