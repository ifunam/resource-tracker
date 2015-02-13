class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :key, type: String
  field :financing_source, type: String
  field :name, type: String
  field :agreement, type: String
  field :sponsor, type: String
  field :start_date, type: Date
  field :end_date, type: Date
  field :inprogress, type: Boolean
  field :authorized_budget, type: Float
  field :deposited_budget, type: Float
  field :committed_budget, type: Float
  field :spent_budget, type: Float

  embeds_many :lines
  slug :name
end
