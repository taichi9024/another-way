class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      redirect_to root_path
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:content)
  end
end
