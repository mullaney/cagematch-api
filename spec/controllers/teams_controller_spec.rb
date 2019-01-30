# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::TeamsController, type: :controller do
  let!(:team) { create(:team) }

  describe 'api/v1' do
    describe 'GET #index' do
      it 'returns a success response' do
        get :index, params: {}
        expect(response).to be_successful
      end
    end

    describe 'GET #show' do
      it 'returns a success response' do
        get :show, params: { id: team.to_param }
        expect(response).to be_successful
      end

      it 'returns data about the correct team' do
        get :show, params: { id: team.to_param }
        team_response = JSON.parse(response.body)['data']
        expect(team_response['name']).to eq(team[:name])
        expect(team_response['tagline']).to eq(team[:tagline])
      end
    end
  end
end
