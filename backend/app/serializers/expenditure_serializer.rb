class ExpenditureSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper
  include ApplicationHelper

  attributes :id,
             :date,
             :motive,
             :amount,
             :status,
             :line_id

  def amount
    number_with_precision object.amount
  end

  def id
    object.key
  end

  def line_id
    object.line.slug
  end
end
