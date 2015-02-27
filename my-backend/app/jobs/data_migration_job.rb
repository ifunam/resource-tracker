require 'zlib'
require 'json'
class DataMigrationJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    backup_path = args.first
    if File.exist? backup_path
      destroy_all
      JSON.parse(Zlib::GzipReader.open(backup_path).read)['projects'].each do |p|
        if p.has_key? 'user'
          user = p['user']
          p.delete 'user'
        end

        if p.has_key? 'lines'
          lines = p['lines']
          p.delete 'lines'
        end

        @project = Project.new(p)
        @project.user = set_user(user)
        @project.save if @project.valid?

        lines.each do |l|
          expenditures = l['expenditures']
          l.delete 'expenditures'

          @line = Line.new(l)
          expenditures.each do |e|
            @line.expenditures << Expenditure.new(e)
          end

          @project.lines << @line
        end
        @project.save

      end
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
