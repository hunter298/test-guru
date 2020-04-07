class QuestionsController < ApplicationController

  before_action :find_test
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: Test.find(params[:test_id]).questions.pluck(:body)
  end

  def show
    render plain: Question.find(params[:id]).body
    byebug
  end

  def new

  end

  def create
    Question.create(test_id: params[:test_id], body: params[:question][:body])
  end

  def edit

  end

  def destroy
    Question.find(params[:id]).destroy
  end

  def find_test
    params.include?('test_id') ? @test = Test.find(params[:test_id]) : @test = Question.find(params[:id]).test
  end

  def rescue_with_question_not_found
    render plain: 'This question not found.'
  end
end
