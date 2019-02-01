# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::SeasonsController, type: :controller do
  let!(:season) { create(:season) }

  describe 'api/v1' do
    describe 'GET #index' do
      it 'returns a success response' do
        get :index, params: {}
        expect(response).to be_successful
      end

      it 'contains correct data' do
        get :index, params: {}
        seasons_response = JSON.parse(response.body)['data']
        expect(seasons_response[0]['name']).to eq(season[:name])
      end
    end

    describe 'GET #show' do
      it 'returns a success response' do
        get :show, params: { id: season.to_param }
        expect(response).to be_successful
      end

      it 'returns data about the correct season' do
        get :show, params: { id: season.to_param }
        season_response = JSON.parse(response.body)['data']
        expect(season_response['name']).to eq(season[:name])
      end
    end
  end
end
