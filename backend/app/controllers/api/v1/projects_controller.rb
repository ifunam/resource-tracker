class Api::V1::ProjectsController < Api::V1::BaseController
  include ActionView::Helpers::NumberHelper
  before_action :set_project, only: [:show]

  # GET /projects
  def index
    @projects = current_api_v1_user.valid_projects.all.page(params[:page] || 1)
    render json: @projects, meta: meta
  end

  # GET /projects/1
  def show
    render json: @project
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def meta
    {
      pagination: {
        current: @projects.current_page,
        per: @projects.default_per_page,
        total: @projects.total_pages
      },
      total: {
        authorized_budget: number_with_precision(@projects.total_authorized_budget),
        deposited_budget: number_with_precision(@projects.total_deposited_budget),
        committed_budget: number_with_precision(@projects.total_committed_budget),
        spent_budget: number_with_precision(@projects.total_spent_budget),
        balance: number_with_precision(@projects.total_balance)
      }
    }
  end
end
