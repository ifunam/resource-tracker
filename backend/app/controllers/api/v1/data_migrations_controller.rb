class Api::V1::DataMigrationsController < ApplicationController
  before_filter :authenticate_by_token!

  def create
    @data_migration = DataMigration.new(backup: params[:backup])
    @data_migration.ip_address = request.remote_ip
    if @data_migration.save
      render json: { msg: 'The data were succesfully saved' }, status: :ok
    else
      render json: { msg: @data_migration.errors.full_messages }, status: 422
    end
  end

  private

  def authenticate_by_token!
    secret_path = File.join(Rails.root, 'config/secrets.yml')
    secret = IO.read(secret_path)
    api_key = YAML.load(secret)[Rails.env]['api_key']
    head :unauthorized unless api_key == request.headers.env['HTTP_X_API_TOKEN']
  end
end
