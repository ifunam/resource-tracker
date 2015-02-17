class LineSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper
  include ApplicationHelper

  attributes :key,
             :name,
             :deposited_budget,
             :committed_budget,
             :spent_budget,
             :id,
             :project_id

  def deposited_budget
    number_with_precision object.deposited_budget
  end

  def committed_budget
    number_with_precision object.committed_budget
  end

  def spent_budget
    number_with_precision object.spent_budget
  end

  def id
    object.slug
  end

  def project_id
    object.project.slug
  end
end
