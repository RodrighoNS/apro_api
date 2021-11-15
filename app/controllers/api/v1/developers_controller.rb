# frozen_string_literal: true

module Api
  module V1
    class DevelopersController < ApplicationController
      before_action :set_developer, only: [:show, :update, :destroy]

      # GET /developers
      def index
        @developers = Developer.all
        json_response(@developers)
      end

      # GET /developers/:id
      def show
        json_response(@developer)
      end

      # POST /developers
      # create! raises an exception if there
      # are errors in model validations
      def create
        @developer = Developer.create!(developer_params)
        json_response(@developer, :created)
      end

      private

      def developer_params
        params.permit(:name, :role)
      end

      def set_developer
        @developer = Developer.find(params[:id])
      end
    end
  end
end
