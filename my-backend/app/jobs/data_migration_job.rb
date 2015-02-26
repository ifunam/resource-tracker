require 'zlib'
require 'json'
class DataMigrationJob < ActiveJob::Base
  queue_as :default #:low_priority

  def perform(path)
    destroy_all
    JSON.parse(Zlib::GzipReader.open(path).read)['projects'].each do |p|
      if p.has_key? 'user'
        user = p['user']
        p.delete 'user'
      end

      if p.has_key? 'lines'
        lines = p['lines']
        lines.each do |l|
          l['expenditures_attributes'] = l['expenditures']
          l.delete 'expenditures'
        end
        p.delete 'lines'
      end

      @project = Project.new(p)
      @project.user = set_user(user)
      @project.lines_attributes = lines
      @project.save if @project.valid?

    end
  end

  private
  def destroy_all
    [Expenditure, Line, Project].each do |klass|
      klass.destroy_all
    end
  end

  def set_user(h)
    if User.where(login: h['login']).exists?
      User.where(login: h['login']).first
    else
      h.merge!(password: h['key'], password_confirmation: h['key'])
      User.create(h)
    end
  end
end
