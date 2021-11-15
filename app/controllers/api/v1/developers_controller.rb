# frozen_string_literal: true

module Api
  module V1
    class DevelopersController < ApplicationController
      # GET /developers
      def index
        @developers = Developer.all
        json_response(@developers)
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
    end
  end
end
