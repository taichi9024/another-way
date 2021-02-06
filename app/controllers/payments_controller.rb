class PaymentsController < ApplicationController
  before_action :set_space
  def new
    @payment = Payment.new
  end

  def create
    Payjp.api_key = 'sk_test_de55c977d92396a2478d37c3'
    charge = Payjp::Charge.create(
      :amount => @space.price,
      :card => params['payjp-token'],
      :currency => 'jpy',
    )
    @payment = Payment.new(user_id: current_user.id, owner: @space.user.name,placename: @space.name, price: @space.price)
    if @payment.save
      redirect_to @space, notice: 'ありがとうございました'
    else
      render :new
    end
  end
    
  def index
  end

  private
  def set_space
    @space = Space.find_by(id: params[:space_id])
  end
end
