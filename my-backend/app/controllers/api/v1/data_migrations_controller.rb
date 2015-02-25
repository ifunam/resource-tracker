class Api::V1::DataMigrationsController < ApplicationController
  def create
    @data_migration = DataMigration.new(:backup => params[:backup])
    @data_migration.ip_address = request.remote_ip
    if @data_migration.save
      render json: { msg: 'The data were succesfully saved' }, status: :ok
    else
      render json: { msg: @data_migration.errors.full_messages }, status: 422
    end
  end
end
