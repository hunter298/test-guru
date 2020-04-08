class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show edit destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.pluck(:body)
  end

  def show
    render plain: @question.body
  end

  def new

  end

  def create
    question = @test.questions.create!(question_params)
    render plain: question.inspect
  end

  def edit

  end

  def destroy
    Question.find(params[:id]).destroy
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
    {test_id: @test.id, body: params[:question][:body]}
  end
end
