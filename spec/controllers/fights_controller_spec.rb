# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::FightsController, type: :controller do
  let!(:fight) { create(:fight) }
  let!(:score) { create(:score, fight_id: fight[:id]) }

  describe 'api/v1' do
    describe 'GET #index' do
      it 'returns a success response' do
        get :index, params: {}
        expect(response).to be_successful
      end
    end

    describe 'GET #show' do
      it 'returns a success response' do
        get :show, params: { id: fight.to_param }
        expect(response).to be_successful
      end

      it 'returns data about the correct fight' do
        get :show, params: { id: fight.to_param }
        fight_response = JSON.parse(response.body)['data']['fight']
        expect(fight_response['tagline']).to eq(fight[:tagline])
        expect(fight_response['location']).to eq(fight[:location])
        expect(fight_response['season']).to eq(fight[:season])
        expect(fight_response['notes']).to eq(fight[:notes])
        expect(fight_response['is_exhibition']).to eq(fight[:is_exhibition])
      end

      it 'returns scores associated with the fight' do
        get :show, params: { id: fight.to_param }
        scores = JSON.parse(response.body)['data']['scores']
        expect(scores.length).to eq(1)
        expect(scores[0]['votes']).to eq(score[:votes])
      end
    end
  end
end
