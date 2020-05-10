class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show

  end

  def result

  end

  def check

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      @test_passage.successful? ? @test_passage.update(success: true) : @test_passage.update(success: false)
          # earned_budges(@test_passage).each { |badge| @test_passage.user.badges.push(badge) }
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      Gist.create!(question: @test_passage.current_question.body, gist_url: result.html_url, user_id: current_user.id)
      flash[:notice] = "#{t('.success')} #{view_context.link_to(t('.view'), result.html_url, target: '_blank')}"
    else
      flash[:alert] =  t('.fail')
    end

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
