# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::CagematchesController, type: :controller do
  describe 'api/v1' do
    describe 'GET #index' do
      it 'returns a success response' do
        get :index, params: {}
        expect(response).to be_successful
      end
    end

    describe 'GET #show' do
      let(:cagematch) { create(:cagematch) }
      it 'returns a success response' do
        get :show, params: { id: cagematch.to_param }
        expect(response).to be_successful
      end

      it 'returns data about the correct cagematch' do
        get :show, params: { id: cagematch.to_param }
        cagematch_response = JSON.parse(response.body)['data']
        expect(cagematch_response['title']).to eq(cagematch[:title])
        expect(cagematch_response['slug']).to eq(cagematch[:slug])
        expect(cagematch_response['description']).to eq(cagematch[:description])
      end
    end
  end
end
