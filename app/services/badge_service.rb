class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
    @success = test_passage.success
    @attempt = test_passage.attempt
    @passed_tests = TestPassage.where(user: @user, success: true).pluck(:test_id)
  end

  def badges
    Badge.where(parameter: conditions_matched)
  end



  def conditions_matched
    if @test_passage.success
      [] << check_test << check_category << check_level << check_attempt
    end
  end

  def check_test
    @test.title + 'tst'
  end

  def check_category
    if (Test.where(category: @test.category).pluck(:id) - @passed_tests).empty?
      @test.category.title + 'ctg'
    end
  end

  def check_level
    if (Test.where(level: @test.level).pluck(:id) - @passed_tests).empty?
      @test.level.to_s + 'lvl'
    end
  end

  def check_attempt
    (@attempt.to_s + 'atm') if (TestPassage.where(user: @user, test: @test, success: true).count == 1)
  end

end