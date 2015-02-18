class ProjectSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper
  include ApplicationHelper

  attributes :key,
             :financing_source,
             :name,
             :agreement,
             :sponsor_abbrev,
             :sponsor_name,
             :start_date,
             :end_date,
             :authorized_budget,
             :deposited_budget,
             :committed_budget,
             :spent_budget,
             :id,
             :links,
             :sponsor_full_name,
             :agreement_and_name

  def authorized_budget
    number_with_precision object.authorized_budget
  end

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

  def links
    { lines: "/api/v1/projects/#{object.slug}/lines" }
  end

  def sponsor_full_name
    object.sponsor_full_name
  end

  def agreement_and_name
    object.agreement_and_name
  end
end
