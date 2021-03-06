# frozen_string_literal: true

module Api
  module V1
    # app/controllers/api/v1/posts_controller.rb
    class PostsController < ApplicationController
      def index
        posts = Post.order('published_at DESC')
        render json: {
          status: 'SUCCESS',
          message: 'Loaded Posts',
          data: posts
        }, status: :ok
      end

      def show
        post = Post.find(params[:id])
        render json: {
          status: 'SUCCESS',
          message: 'Loaded Post',
          data: post
        }, status: :ok
      rescue StandardError
        render json: data_not_found('Post'), status: :not_found
      end

      private

      def data_not_found(model)
        {
          error: 'not_found',
          status: 'NOT_FOUND',
          message: "#{model} not found"
        }
      end
    end
  end
end
