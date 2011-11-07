class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def authenticate
    authenticate_or_request_with_http_basic("ColorManiac") do |username, password|
      username == "administrator" && password == "password"
    end
  end
end
