class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question successfully submitted!"
      redirect_to questions_path
    else
      flash[:notice] = "Invalid input, please try again!"
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end

end
