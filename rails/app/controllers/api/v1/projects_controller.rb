class Api::V1::ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  # GET /projects
  def index
    @projects = Project.all.page params[:page] || 1
    render json: @projects
  end

  # GET /projects/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params[:project]
    end
end
