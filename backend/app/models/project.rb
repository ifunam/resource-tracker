class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :key, type: String
  field :financing_source, type: String
  field :name, type: String
  field :agreement, type: String
  field :sponsor_abbrev, type: String
  field :sponsor_name, type: String
  field :start_date, type: Date
  field :end_date, type: Date
  field :inprogress, type: Boolean
  field :authorized_budget, type: Float
  field :deposited_budget, type: Float
  field :committed_budget, type: Float
  field :spent_budget, type: Float

  embeds_many :lines, inverse_of: :project, order: [:key.asc, :name.asc]
  belongs_to :user

  slug :name, :key

  def self.total_authorized_budget
    sum(:authorized_budget)
  end

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
    self.total_authorized_budget.to_f - self.total_committed_budget.to_f - self.total_committed_budget.to_f
  end

  def sponsor_full_name
    "[#{sponsor_abbrev}] " + sponsor_name.to_s
  end

  def agreement_and_name
    [key, agreement, "(#{start_date.year})", name].compact.join(' ')
  end

  def balance
    authorized_budget.to_f - committed_budget.to_f - spent_budget.to_f
  end
end
