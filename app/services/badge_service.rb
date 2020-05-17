class BadgeService

  attr_reader :passed_tests_ids

  def initialize(test_passage)
    @test = test_passage.test
    @user = test_passage.user
    @success = test_passage.success
    @attempt = test_passage.attempt
    @passed_tests_ids = TestPassage.where(user: @user, success: true).pluck(:test_id)
  end

  def badges
    Badge.select { |badge| send(badge.rule, badge.rule_value) }
  end

  # private

  def check_test(rule_value)
    @test.title == rule_value
  end

  def check_category(rule_value)
    if @test.category_id == rule_value.to_i
      (Test.where(category_id: rule_value).pluck(:id) - @passed_tests_ids).empty?
    end
  end

  def check_level(rule_value)
    if @test.level == rule_value.to_i
      (Test.where(level: rule_value).pluck(:id) - @passed_tests_ids).empty?
    end
  end

  def check_attempt(rule_value)
    @attempt == rule_value.to_i
  end

end