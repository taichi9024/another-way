class BooksController < ApplicationController

    def create
        @book = Book.new
        @space = Space.find_by(id: params[:space_id])
        price = @space.price
        pr,ho,se = price, params[:hours].to_i, params[:seatnum].to_i
        @book = current_user.books.create!(bookdate: params[:bookdate],space_id: params[:space_id], hours: params[:hours],price: price,wholeprice: pr*ho*se, seatnum: params[:seatnum])
        @space.update!(seat: @space.seat - params[:seatnum].to_i)
        flash.notice = "決済画面に遷移しました"
        redirect_to new_space_payment_path(params[:space_id])
    end
end
