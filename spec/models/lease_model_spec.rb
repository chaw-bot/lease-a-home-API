require 'rails_helper'

RSpec.describe Lease, type: :model do
  describe 'Validaiton for post' do
    subject do
      lease_months = 4
      user = User.create(email: 'henry5897995@gmail.com',
                         password: 'kkkkkk', name: 'Henry Kc')
      apartment = Apartment.create(name: 'Apart1',
                                   description: 'Cool', image: 'image.png', interior: ['one'],
                                   maintenance_fee: 100, monthly_rent: 200, city: 'Lagos',
                                   reservation_expiry_date: DateTime.now)

      Lease.create(from: DateTime.now + 1.month, to: (DateTime.now + (1 +
       lease_months).month), cancelled: false,
                   user_id: user.id, apartment_id: apartment.id)
    end

    it 'Should have title present' do
      expect(subject).to be_valid
    end

    it 'Should have title not being too long' do
      subject.to = DateTime.now
      expect(subject).to_not be_valid
    end

    it 'Should have comments counter not be less than zero' do
      subject.to = DateTime.now + 1.month
      subject.from = nil
      expect(subject).to_not be_valid
    end
  end
end
