class Api::V1::ExpendituresController < Api::V1::BaseController
  before_filter :determine_scope

  def index
    @expenditures = @scope.order_by([[:date, :desc], [:motive, :asc]]).all
    render json: @expenditures
  end

  private

  def determine_scope
    @project = Project.find params[:project_slug]
    @line  = @project.lines.find params[:line_slug]
    @scope = @line.expenditures
  end
end
