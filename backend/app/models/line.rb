class Line
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :key, type: Integer
  field :name, type: String
  field :deposited_budget, type: Float
  field :committed_budget, type: Float
  field :spent_budget, type: Float

  embedded_in :project, inverse_of: :lines
  embeds_many :expenditures, order: [:date.asc, :key.asc, :status.asc, :motive.asc]

  slug :name, :key, scope: :project

  def self.total_deposited_budget
    sum(:deposited_budget)
  end

  def self.total_committed_budget
    sum(:committed_budget)
  end

  def self.total_spent_budget
    sum(:spent_budget)
  end

  def self.total_balance
    self.total_deposited_budget.to_f - self.total_committed_budget.to_f - self.total_spent_budget.to_f
  end

  def key_and_name
    ["(#{key})", name].join(' ')
  end

  def balance
    deposited_budget.to_f - committed_budget.to_f - spent_budget.to_f
  end
end
