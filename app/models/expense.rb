class Expense
  include Mongoid::Document
  field :group_key, type: String
  field :group_name, type: String
  field :assigned_budget, type: Float
  field :spent_budget, type: Float
  embedded_in :project
end
