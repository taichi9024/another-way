class Admin::TopController < ApplicationController
  before_action :basic_auth
  protect_from_forgery with: :exception

  def index
    @payments = Payment.all
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_NAME'] && password == ENV['BASIC_PASS']
    end
  end
end
