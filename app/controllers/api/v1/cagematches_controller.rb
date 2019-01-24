# frozen_string_literal: true

module Api
  module V1
    # app/controllers/api/v1/cagematches_controller.rb
    class CagematchesController < ApplicationController
      def index
        cagematches = Cagematch.order('title ASC')
        render json: {
          status: 'SUCCESS',
          message: 'Loaded Cagematches',
          data: cagematches
        }, status: :ok
      end

      def show
        cagematch = Cagematch.find(params[:id])
        render json: {
          status: 'SUCCESS',
          message: 'Loaded Cagematch',
          data: cagematch
        }, status: :ok
      rescue StandardError
        render json: data_not_found('Cagematch'), status: :not_found
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
