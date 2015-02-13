class Line
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :key, type: Integer
  field :name, type: String
  field :deposited_budget, type: Float
  field :committed_budget, type: Float
  field :spent_budget, type: Float

  embedded_in :project
  embeds_many :expenditures

  slug :name, :scope => :project
end
