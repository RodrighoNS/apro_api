require 'rails_helper'

RSpec.describe "Developers API", type: :request do
  let!(:developers) { create_list(:developer, 10) }

  # Test suite for GET /Developers
  describe "GET /developers" do
    before { get '/developers' }

    it 'returns developers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for POST /Developers
  describe 'POST /developers' do
    let(:valid_attributes) { { name: 'Josefina', role: 'frontend dev' } }

    context 'when the request is valid' do
      before { post '/developers', params: valid_attributes }

      it 'creates a developer' do
        expect(json['name']).to eq('Josefina')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/developers', params: { name: 'Homero' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Role can't be blank/)
      end
    end
  end
end
