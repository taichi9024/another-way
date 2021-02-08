class ApplicationController < ActionController::Base
  layout :set_layout

  helper_method :current_staff
  helper_method :page_title

  class Forbidden < ActionController::ActionControllerError; end

  class IpAddressRejected < ActionController::ActionControllerError; end
  include ErrorHandle

  private

  def set_layout
    if params[:controller].include?('admin')
      'admin'
    else
      'application'
    end
  end

  def current_staff
    current_staff = Staff.find_by(id: session[:staff_id]) if session[:staff_id]
  end

  def page_title(page_title = '')
    base_title = 'another way'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
end
