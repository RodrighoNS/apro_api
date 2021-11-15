# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Developers API', type: :request do
  let!(:developers) { create_list(:developer, 10) }
  let(:developer_id) { developers.first.id }

  # Test suite for GET /api/v1/Developers
  describe 'GET /api/v1/developers' do
    before { get '/api/v1/developers' }

    it 'returns developers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /api/v1/developers/:id
  describe 'GET /api/v1/developers/:developer_id' do
    before { get "/api/v1/developers/#{developer_id}" }

    context 'when the record exists' do
      it 'returns the developer' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(developer_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:developer_id) { 101 }

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Developer/)
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # Test suite for POST /api/v1/Developers
  describe 'POST /api/v1/developers' do
    let(:valid_attributes) { { name: 'Josefina', role: 'frontend dev' } }

    context 'when the request is valid' do
      before { post '/api/v1/developers', params: valid_attributes }

      it 'creates a developer' do
        expect(json['name']).to eq('Josefina')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/developers', params: { name: 'Homero' } }

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
