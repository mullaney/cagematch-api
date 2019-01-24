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

      it 'returns data about the correct post' do
        get :show, params: { id: post.to_param }
        post_response = JSON.parse(response.body)['data']
        expect(post_response['title']).to eq(post[:title])
        expect(post_response['author']).to eq(post[:author])
        expect(post_response['text']).to eq(post[:text])
        expect(post_response['category']).to eq(post[:category])
      end
    end
  end
end
