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
        begin
          team = Team.find(params[:id])
          render json: {
            status: 'SUCCESS',
            message: 'Loaded Team',
            data: team }, status: :ok
        rescue
          render json: {
            error: 'not_found',
            status: 'NOT_FOUND',
            message: 'Team not found'
          }, status: :not_found
        end
      end
    end
  end
end
