class Expenditure
  include Mongoid::Document
  include Mongoid::Timestamps

  field :key, type: String
  field :date, type: Date
  field :motive, type: String
  field :amount, type: Float
  field :condition, type: String

  embedded_in :line
end
