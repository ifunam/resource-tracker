# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
require 'factory_girl'

unless Rails.env.production?
  100.times do
    p = FactoryGirl.build(:project)
    Random.rand(1..10).times do
      l = FactoryGirl.build(:line)
      Random.rand(1..10).times do
        l.expenditures << FactoryGirl.build(:expenditure)
      end
      p.lines << l
    end
    p.save
  end
end
