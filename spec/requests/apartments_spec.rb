require 'rails_helper'

RSpec.describe 'Leases', type: :request do
  describe 'GET /index' do
    before(:example) do
      get '/apartments'
    end

    it 'Response is a success' do
      expect(response).to have_http_status(:ok)
    end

    before(:example) do
      @apartment = Apartment.create(name: 'Apart1', description: 'Cool', image: 'image.png', interior: ['one'],
                                    maintenance_fee: 100, monthly_rent: 200, city: 'Lagos',
                                    reservation_expiry_date: DateTime.now)
    end

    it 'is a success' do
      expect(response).to have_http_status(200)
      expect(@apartment.name).to eq(Apartment.last.name)
    end

    before(:example) do
      @apartment = Apartment.create(name: 'Apart1', description: 'Cool',
                                    image: 'image.png', interior: ['one'],
                                    maintenance_fee: 100,
                                    monthly_rent: 200, city: 'Lagos', reservation_expiry_date: DateTime.now)

      get "/apartments/#{@apartment.id}"
    end
    it 'is a success' do
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['id']).to eq(@apartment.id)
    end
  end
end
