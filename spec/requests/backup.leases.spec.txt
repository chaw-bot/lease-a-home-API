require 'rails_helper'

RSpec.describe 'Leases', type: :request do
  describe 'GET /index' do
    before(:example) do
      @user1 = User.create(email: 'henry5897@gmail.com', password: 'kkkkkk', name: 'Henry Kc')
      get "/user/#{@user1.id}/leases"
    end

    it 'Response is a success' do
      expect(response).to have_http_status(:ok)
    end

    before(:example) do
      lease_months = 4
      user = User.create(email: 'henry58979954@gmail.com', password: 'kkkkkk', name: 'Henry Kc')
      apartment = Apartment.create(name: 'Apart1', description: 'Cool', image: 'image.png', interior: ['one'],
                                   maintenance_fee: 100, monthly_rent: 200, city: 'Lagos',
                                   reservation_expiry_date: DateTime.now)

      Lease.create(from: DateTime.now + 1.month, to: (DateTime.now + (1 + lease_months).month), cancelled: false,
                   user_id: user.id, apartment_id: apartment.id)
    end

    it 'is a success' do
      expect(JSON.parse(response.body).size).to eq(1)
    end

    before(:example) do
      lease_months = 4
      @user3 = User.create(email: 'henry5897995@gmail.com',
                           password: 'kkkkkk', name: 'Henry Kc')
      @apartment = Apartment.create(name: 'Apart1', description: 'Cool',
                                    image: 'image.png', interior: ['one'],
                                    maintenance_fee: 100,
                                    monthly_rent: 200, city: 'Lagos', reservation_expiry_date: DateTime.now)
      @lease2 = Lease.new(from: @apartment.reservation_expiry_date + 1.month,
                          to: @apartment.reservation_expiry_date + (1 + lease_months).month,
                          cancelled: 1, user_id: @user3.id, apartment_id: @apartment.id)
      @lease2.save
      get "/user/#{@user3.id}/leases"
    end
    it 'is a success' do
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end
end
