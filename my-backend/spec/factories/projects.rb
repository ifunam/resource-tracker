# encoding: utf-8
require 'ffaker'
FactoryGirl.define do
  factory :project do
    key                 { [Random.rand(300..999), Random.rand(600..999)].join(' - ') }
    financing_source    { Faker::Company.name }
    name                { Faker::NameMX.full_name }
    agreement           { Random.rand(300..5000) }
    sponsor_abbrev      { Faker::Lorem.word.upcase }
    sponsor_name        { Faker::Lorem.sentence }
    start_date          { Date.today }
    end_date            { Random.rand(600).days.from_now }
    inprogress          { Random.rand(0..1) == 1 }
    authorized_budget   { Random.rand(100000000.00) }
    deposited_budget    { Random.rand(50000000.00) }
    committed_budget    { Random.rand(4000000.00) }
    spent_budget        { Random.rand(500000.00) }
  end
end
