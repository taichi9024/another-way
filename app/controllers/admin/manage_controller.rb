class Admin::ManageController < Admin::Base
  before_action :login_first

  PER = 10
  def user
    @users = User.page(params[:page]).per(PER)
    respond_to do |format|
      format.html do
      end
      format.csv do
      end
    end
  end

  def payment
    @payments = Payment.page(params[:page]).per(PER)
    respond_to do |format|
      format.html do
      end
      format.csv do
      end
    end
  end

  def space
    @spaces = Space.page(params[:page]).per(PER)
    respond_to do |format|
      format.html do
      end
      format.csv do
      end
    end
  end

  def comment
    @comments = Comment.page(params[:page]).per(PER)
    respond_to do |format|
      format.html do
      end
      format.csv do
      end
    end
  end

  def fb
    @feedbacks = Feedback.page(params[:page]).per(PER)
    respond_to do |format|
      format.html do
      end
      format.csv do
      end
    end
  end
end
