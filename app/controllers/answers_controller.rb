class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:notice] = "Comment Saved"
      redirect_to @question
    else
      flash.now[:notice] = "Invalid answer!  Please try again."
      redirect_to @question
    end
  end

  private
  def answer_params
    results = params.require(:answer).permit(:description)
    results[:question_id] = params[:question_id]
    results
  end

end
