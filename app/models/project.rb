class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :key, type: String
  field :financing_source, type: String
  field :sponsor, type: String
  field :manager, type: String
  field :start_date, type: Date
  field :end_date, type: Date
  field :year, type: Integer
  field :budget_amount, type: Float
  field :budget_spent_amount, type: Float
end
