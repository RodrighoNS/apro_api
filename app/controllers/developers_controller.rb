class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show]

  # GET /developers
  def index
    @developers = Developer.all
    json_response(@developers)
  end

  # POST /developers
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
