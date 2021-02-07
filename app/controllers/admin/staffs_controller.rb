class Admin::StaffsController < ApplicationController
    def new
        @staff = Staff.new
    end

    def create
        @staff = Staff.find_by(name: staff_params[:name])
        if @staff
            session[:staff_id] = @staff.id
            redirect_to admin_dashboard_path
        end
    end

    def destroy
        @staff = Staff.find_by(id: params[:id])
        reset_session
        redirect_to admin_root_path
    end

    private
    def staff_params
        params.require(:staff).permit(:name)
    end
end
