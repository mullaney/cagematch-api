# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::TeamsController, type: :controller do
  let!(:team) { create(:team) }
  let(:valid_session) { {} }

  describe 'api/v1' do
    describe 'GET #index' do
      it 'returns a success response' do
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe 'GET #show' do
      it 'returns a success response' do
        get :show, params: { id: team.to_param }, session: valid_session
        expect(response).to be_successful
      end
    end
  end
end
