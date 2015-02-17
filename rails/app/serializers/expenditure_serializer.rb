class ExpenditureSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper
  include ApplicationHelper

  attributes :id, :date, :motive, :amount, :condition

  def amount
    number_with_precision object.amount
  end

  def id
    object.key
  end
end
