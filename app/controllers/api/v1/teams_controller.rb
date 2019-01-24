# frozen_string_literal: true

module Api
  module V1
    # app/controllers/api/v1/teams_controller.rb
    class TeamsController < ApplicationController
      def index
        teams = Team.order('name ASC')
        render json: {
          status: 'SUCCESS',
          message: 'Loaded Teams',
          data: teams
        }, status: :ok
      end

      def show
        team = Team.find(params[:id])
        render json: {
          status: 'SUCCESS',
          message: 'Loaded Team',
          data: team }, status: :ok
      rescue StandardError
        render json: data_not_found('Team'), status: :not_found
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
