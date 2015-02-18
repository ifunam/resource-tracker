# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
require 'factory_girl'

@user = User.create(login: 'test', email: 'test@fisica.unam.mx', password: 'qw1234..', password_confirmation: 'qw1234..')
unless Rails.env.production?
  50.times do
    p = FactoryGirl.build(:project)
    p.save
    Random.rand(1..20).times do
      l = FactoryGirl.build(:line)
      Random.rand(1..20).times do
        l.expenditures << FactoryGirl.build(:expenditure)
      end
      p.lines << l
    end
    p.user = @user
    p.save
  end
end
