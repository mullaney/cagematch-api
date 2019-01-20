module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.order('published_at DESC')
        render json: {
          status: 'SUCCESS',
          message: 'Loaded Posts',
          data: posts }, status: :ok
      end

      def show
        begin
          post = Post.find(params[:id])
          render json: {
            status: 'SUCCESS',
            message: 'Loaded Post',
            data: post 
          }, status: :ok
        rescue
          render json: {
            error: 'not_found',
            status: 'NOT_FOUND',
            message: 'Post not found'
          }, status: :not_found
        end
      end
    end
  end
end
