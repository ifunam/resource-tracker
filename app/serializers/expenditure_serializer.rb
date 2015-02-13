class ExpenditureSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper
  include ApplicationHelper

  attributes :key, :date, :motive, :amount, :condition

  def amount
    number_with_precision object.amount
  end
end
