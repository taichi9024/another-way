class Admin::TopController < ApplicationController

  before_action :basic_auth    
  protect_from_forgery with: :exception

  def index
    @q = Space.all.ransack(params[:q])
    @spaces = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_NAME"] && password == ENV["BASIC_PASS"]
    end
  end
  
end
