class Api::V1::ProjectsController < Api::V1::BaseController
  before_action :set_project, only: [:show]

  # GET /projects
  def index
    @projects = current_api_v1_user.projects.all.page(params[:page] || 1)
    render json: @projects,
      meta: {
        current_page: @projects.current_page,
        per_page: @projects.default_per_page,
        total_pages: @projects.total_pages
      }
  end

  # GET /projects/1
  def show
    render json: @project
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end
