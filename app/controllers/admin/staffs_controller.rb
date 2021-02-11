class Admin::StaffsController < Admin::Base
  skip_before_action :login_first
  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(staff_params)
    staff = Staff.find_by(name: staff_params[:name])
    if staff.name == @staff.name && BCrypt::Password.new(staff.password_digest) == @staff.password
      session[:staff_id] = staff.id
      redirect_to admin_dashboard_path, notice: "#{staff.name}でログインしました"
    else
      render :new
    end
  end

  def destroy
    @staff = Staff.find_by(id: params[:id])
    reset_session
    redirect_to admin_root_path, notice: 'ログアウトしました'
  end

  private

  def staff_params
    params.require(:staff).permit(:name, :password)
  end
end
