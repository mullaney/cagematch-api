# frozen_string_literal: true

module Api
  module V1
    # app/controllers/api/v1/fights_controller.rb
    class FightsController < ApplicationController
      def index
        fights = Fight.order('start_time DESC')
        render json: {
          status: 'SUCCESS',
          message: 'Loaded Fights',
          data: fights
        }, status: :ok
      end

      def show
        fight = Fight.find(params[:id])
        scores = Score.where(fight_id: fight[:id])
        render json: {
          status: 'SUCCESS',
          message: 'Loaded Fight',
          data: { fight: fight, scores: scores }
        }, status: :ok
      rescue StandardError
        render json: data_not_found('Fight'), status: :not_found
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
