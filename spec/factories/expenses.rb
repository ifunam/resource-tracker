require 'ffaker'
FactoryGirl.define do
  factory :expense do
    group_key { Random.rand(300..900).to_s }
    group_name { Faker::Lorem.words(Random.rand(1..5)).join(' ').capitalize }
    assigned_budget { Random.rand(300000.00) } 
    spent_budget { Random.rand(300000.00) }
  end

end
