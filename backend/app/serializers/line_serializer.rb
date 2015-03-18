class LineSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper
  include ApplicationHelper

  attributes :key,
             :name,
             :deposited_budget,
             :committed_budget,
             :spent_budget,
             :id,
             :project_id,
             :links,
             :key_and_name,
             :balance,
             :has_expenditures

  def deposited_budget
    number_with_precision object.deposited_budget
  end

  def committed_budget
    number_with_precision object.committed_budget
  end

  def spent_budget
    number_with_precision object.spent_budget
  end

  def balance
    number_with_precision object.balance
  end

  def id
    object.slug
  end

  def project_id
    object.project.slug
  end

  def links
    { expenditures: "/api/v1/projects/#{object.project.slug}/lines/#{object.slug}/expenditures" }
  end

  def key_and_name
    object.key_and_name
  end

  def has_expenditures
    object.expenditures.count > 0
  end
end
