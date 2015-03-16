class Api::V1::BaseController < ApplicationController
  before_filter :authenticate_user_from_token!

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

end
