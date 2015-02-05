# encoding: utf-8
require 'ffaker'
FactoryGirl.define do
  factory :project do
    key                 { [Random.rand(300..999), Random.rand(600..999)].join(' - ') }
    financing_source    { Faker::Company.name }
    start_date          { Date.today }
    end_date            { Random.rand(600).days.from_now }
    sponsor             "[IFUNAM] Instituto de Física"
    manager             { Faker::NameMX.full_name }
    year                { Date.today.year }
    budget_amount       { Random.rand(10000000.00) }
    budget_spent_amount { Random.rand(50000.00) }
  end
end
