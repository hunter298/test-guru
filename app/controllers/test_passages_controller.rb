class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    Gist.create!(question: @test_passage.current_question.body, gist_url: result.data[:html_url], user_id: current_user.id)

    flash_options = if result.status.to_s =~ /^2/
                      {notice: ("#{t('.success')} #{view_context.link_to(t('.view'), result.data[:html_url])}") }
                    else
                      {alert: t('.fail')}
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
