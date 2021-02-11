class PaymentsController < ApplicationController
  before_action :set_space
  before_action :set_book, only: %i[new create destroy]

  def new
    @payment = Payment.new
  end

  def create
    Payjp.api_key =ENV["PAYJP_SECRET"]
    charge = Payjp::Charge.create(
      amount: @set_book.wholeprice,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    @payment = Payment.new(user_id: current_user.id, owner: @set_book.space.name, placename: @space.name,
                           price: @set_book.wholeprice)
    if @payment.save
      redirect_to @space, notice: '決済が終了しました'
    else
      render :new
    end
  end

  def book_create
    @book = Book.new
    price = @space.price
    pr,ho,se = price, params[:hours].to_i, params[:seatnum].to_i
    @book = current_user.books.create!(bookdate: params[:bookdate],space_id: params[:space_id], hours: params[:hours],price: price,wholeprice: pr*ho*se, seatnum: params[:seatnum])
    @space.update!(seat: @space.seat - params[:seatnum].to_i)
    flash.notice = "決済画面に遷移しました"
    redirect_to new_space_payment_path(params[:space_id])
  end

  def destroy
    @set_book.delete
    redirect_to @space,alert:"取引を中止しました"
  end

  private

  def set_space
    @space = Space.find_by(id: params[:space_id])
  end

  def set_book
    @set_book = Book.where(space_id: @space.id, user_id: current_user.id).last
  end
end
