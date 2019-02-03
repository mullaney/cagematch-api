# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::SeasonsController, type: :controller do
  let(:season) { create(:season) }
  let!(:fight) { create(:fight, season: season) }

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
        season_response = JSON.parse(response.body)['data']['season']
        expect(season_response['name']).to eq(season[:name])
      end

      it 'returns a list fights for that season' do
        get :show, params: { id: season.to_param }
        fights = JSON.parse(response.body)['data']['fights']
        expect(fights.length).to eq(1)
        expect(fights.first['location']).to eq(fight[:location])
      end
    end
  end
end
