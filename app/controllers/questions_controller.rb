class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show edit destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.where(test_id: params[:test_id])
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.create!(question_params)
    if @question.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question.destroy

    redirect_to @question.test
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'This question not found.'
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end
end
