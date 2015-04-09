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
