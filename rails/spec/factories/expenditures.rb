require 'ffaker'
FactoryGirl.define do
  factory :expenditure do
    key       { Random.rand(300..900).to_s }
    date      { (Date.today + Random.rand(300)) }
    motive    { Faker::Lorem.paragraph }
    amount    { Random.rand(15000.00) } 
    condition { Faker::Lorem.paragraph }
  end
end
