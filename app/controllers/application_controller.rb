class ApplicationController < ActionController::Base
    layout :set_layout

    helper_method :current_staff

    private
    def set_layout
        if params[:controller].include?("admin")
            "admin"
        else
            "application"
        end
    end

    def current_staff
        if session[:staff_id]
            current_staff = Staff.find_by(id: session[:staff_id])
        end
    end
end
