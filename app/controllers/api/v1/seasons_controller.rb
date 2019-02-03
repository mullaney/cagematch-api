# frozen_string_literal: true

module Api
  module V1
    # app/controllers/api/v1/seasons_controller.rb
    class SeasonsController < ApplicationController
      def index
        seasons = Season.order('created_at DESC')
        render json: {
          status: 'SUCCESS',
          message: 'Loaded Seasons',
          data: seasons
        }, status: :ok
      end

      def show
        season = Season.find(params[:id])
        fights = Fight.where(season_id: season[:id])
        render json: {
          status: 'SUCCESS',
          message: 'Loaded Season',
          data: { season: season, fights: fights }
        }, status: :ok
      rescue StandardError
        render json: data_not_found('Season'), status: :not_found
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
