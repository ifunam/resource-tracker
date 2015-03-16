class Api::V1::SessionsController < Devise::SessionsController
  skip_before_filter :authenticate_user_from_token!

  def create
    respond_to do |format|
      format.json do
        @resource = warden.authenticate!(auth_options)
        sign_in(resource_name, @resource)
        render json: response_data.to_json, status: 201
      end
    end
  end

  private

  def response_data
    {
      token: @resource.authentication_token,
      login: @resource.login
    }
  end
end
