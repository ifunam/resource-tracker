class Api::V1::LinesController < Api::V1::BaseController
  include ActionView::Helpers::NumberHelper
  before_filter :determine_scope

  def index
    @lines = @scope.all
    render json: @lines, meta: meta
  end

  private

  def determine_scope
    @project = Project.find params[:project_slug]
    @scope = @project.lines
  end

  def meta
    {
      total: {
        deposited_budget: number_with_precision(@lines.total_deposited_budget),
        committed_budget: number_with_precision(@lines.total_committed_budget),
        spent_budget: number_with_precision(@lines.total_spent_budget),
        balance: number_with_precision(@lines.total_balance)
      }
    }
  end
end
