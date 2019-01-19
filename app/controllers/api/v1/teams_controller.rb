module Api
  module V1
    class TeamsController < ApplicationController
      def index
        teams = Team.order('name ASC')
        render json: {
          status: 'SUCCESS',
          message: 'Loaded Teams',
          data: teams }, status: :ok
      end

      def show
        team = Team.find(params[:id])
        render json: {
          status: 'SUCCESS',
          message: 'Loaded Team',
          data: team }, status: :ok
      end
    end
  end
end
