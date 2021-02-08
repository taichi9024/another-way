class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      FeedbackMailer.feedback_send(@feedback).deliver_now!
      redirect_to root_path, notice: 'フィードバックいただきありがとうございます！'
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:content, :email)
  end
end
