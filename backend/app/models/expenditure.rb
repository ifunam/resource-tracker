class Expenditure
  include Mongoid::Document
  include Mongoid::Timestamps

  field :key, type: String
  field :date, type: Date
  field :motive, type: String
  field :amount, type: Float
  field :status, type: String

  embedded_in :line

  def self.total_amount
    sum(:amount)
  end
end
