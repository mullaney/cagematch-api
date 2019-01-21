# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  describe 'api/v1' do
    describe 'GET #index' do
      it 'returns a success response' do
        get :index, params: {}
        expect(response).to be_successful
      end
    end

    describe 'GET #show' do
      let(:post) { create(:post) }
      it 'returns a success response' do
        get :show, params: { id: post.to_param }
        expect(response).to be_successful
      end
    end
  end
end
