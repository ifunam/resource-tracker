class Api::V1::BaseController < ApplicationController
  before_filter :authenticate_user_from_token!
  before_filter :verify_migration_status!

  protected

  def authenticate_user_from_token!
    authenticate_with_http_token do |token, options|
      login = options[:login].presence
      user  = User.where(login: login).first
      if !user.nil? && Devise.secure_compare(user.authentication_token, token)
        sign_in user, store: false
      end
    end
  end

  def verify_migration_status!
    if DataMigration.pending.count > 0
      payload = { :error =>  "Migration in progress..."  }
      render json: payload, status: 423
    end
  end
end
