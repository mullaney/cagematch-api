module Api
  module V1
    class CagematchesController < ApplicationController
      def index
        cagematches = Cagematch.order('title ASC')
        render json: {
          status: 'SUCCESS',
          message: 'Loaded Cagematches',
          data: cagematches }, status: :ok
      end

      def show
        cagematch = Cagematch.find(params[:id])
        render json: {
          status: 'SUCCESS',
          message: 'Loaded Cagematch',
          data: cagematch }, status: :ok
      end
    end
  end
end
