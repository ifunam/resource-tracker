require 'json'
require 'zlib'

class DataMigrationJob < ActiveJob::Base
  queue_as :default

  def perform(record_id)
    record = DataMigration.find(record_id)
    return unless File.exist? record.backup.path
    [Expenditure, Line, Project].collect(&:destroy_all)
    @json = Zlib::GzipReader.open(record.backup.path).read
    JSON.parse(@json)['projects'].each do |p|
      import_project(p)
    end
    record.update_attribute :migrated, true
  end

  private

  def import_user(u)
    if User.where(login: u['login']).exists?
      User.where(login: u['login']).first
    else
      User.create(u.merge!(password: u['key'], password_confirmation: u['key']))
    end
  end

  def import_lines(lines)
    lines.collect do |l|
      expenditures = l['expenditures']
      l.delete 'expenditures'
      @line = Line.new(l)
      expenditures.each do |e|
        @line.expenditures << Expenditure.new(e)
      end
      @line
    end
  end

  def import_project(p)
    @user = import_user(p['user'])
    p.delete_if { |k, v| v if k == 'user' }

    @lines = import_lines(p['lines'])
    p.delete_if { |k, v| v if k == 'lines' }

    @project = Project.new(p)
    @project.user = @user
    @project.save # Save it before to avoid troubles with its childrens
    @project.lines = @lines
    @project.save
  end
end
