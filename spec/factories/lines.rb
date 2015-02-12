require 'ffaker'
FactoryGirl.define do
  factory :line do
    key                 { Random.rand(300..900) }
    name                { Faker::Lorem.phrase }
    deposited_budget    { Random.rand(500000.00) }
    committed_budget    { Random.rand(30000.00) }
    spent_budget        { Random.rand(15000.00) }
  end
end
