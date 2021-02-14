module ErrorHandle
  extend ActiveSupport::Concern

  included do
    #rescue_from StandardError,  with: :e500
    rescue_from ApplicationController::Forbidden, with: :e403
    rescue_from ApplicationController::IpAddressRejected, with: :e403
    rescue_from ActiveRecord::RecordNotFound, with: :e404
  end

  private

  def e403(e)
    @exception = e
    render 'errors/e403', status: 403
  end

  def e404(e)
    @exception = e
    render 'errors/e404', status: 404
  end

  def e500(e)
    @exception = e
    render 'errors/e500', status: 500
  end
end
