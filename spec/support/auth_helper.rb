module AuthHelper
  def basic_login
    user = Rails.application.credentials.basic_auth[:user]
    password = Rails.application.credentials.basic_auth[:pass]
    request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials(user, password)
  end
end
