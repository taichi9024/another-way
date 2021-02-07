class Admin::ManageController < ApplicationController
  PER = 10
  def user
    @users = User.page(params[:page]).per(PER)
  end

  def payment
    @payments = Payment.page(params[:page]).per(PER)
  end

  def space
    @spaces = Space.page(params[:page]).per(PER)
  end

  def comment
    @comments = Comment.page(params[:page]).per(PER)
  end

  def fb
    @feedbacks = Feedback.page(params[:page]).per(PER)
  end

end
