class Admin::Base < ApplicationController

    helper_method :current_staff
    before_action :login_first

    private

    def login_first
        unless current_staff
          redirect_to admin_root_path,notice: "先にログインをしてください"
        end 
    end

    def current_staff
      current_staff = Staff.find_by(id: session[:staff_id]) if session[:staff_id]
    end
end