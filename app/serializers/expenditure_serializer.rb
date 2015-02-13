class ExpenditureSerializer < ActiveModel::Serializer
  attributes :key, :date, :motive, :amount, :condition
end
