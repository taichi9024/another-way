class ApplicationController < ActionController::Base
    layout :set_layout

    private
    def set_layout
        if params[:controller].include?("admin")
            "admin"
        else
            "application"
        end
    end
end
