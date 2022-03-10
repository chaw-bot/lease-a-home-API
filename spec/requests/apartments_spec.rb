require 'swagger_helper'

RSpec.describe 'apartments', type: :request do
  # rubocop:disable Metrics/BlockLength
  path '/apartments' do
    get('list apartments') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create apartment') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :apartment, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            description: { type: :string },
            image: { type: :string },
            interior: { type: :array, items: { type: :string } },
            maintenance_fee: { type: :number },
            monthly_rent: { type: :number },
            city: { type: :string },
            reservation_expiry_date: { type: :string, format: :datetime }
          },
          required: %w[name description image interior maintenance_fee monthly_rent city reservation_expiry_date]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/apartments/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show apartment') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update apartment') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update apartment') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete apartment') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
  # rubocop:enable Metrics/BlockLength
end
