class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
    @success = test_passage.success
    @passed_tests_ids = TestPassage.where(user: @user, success: true).pluck(:test_id)
  end

  def badges
    @test_passage.successful? ? (Badge.select { |badge| send(badge.rule, badge.rule_value) }) : []
  end

  # private

  def check_test(rule_value)
    @test.title == rule_value
  end

  # method check (1) last test_passage test category is match rule_value (2) all test of this category were passed earlier
  # (3) all test passed earlier were passed  not less times then last one
  def check_category(rule_value)
    if @test.category_id == rule_value.to_i && (Test.where(category_id: rule_value).pluck(:id) - @passed_tests_ids).empty?
      condition_passed_ids = TestPassage.where(user: @user, success: true, test: Test.where(category_id: rule_value)).pluck(:test_id).tally
      condition_passed_ids.values.each { |v| break false if v < condition_passed_ids[@test.id] }
    end
  end

  # method check (1) last test_passage test level is match rule_value (2) all test of this level were passed earlier
  # (3) all test passed earlier were passed  not less times then last one
  def check_level(rule_value)
    if @test.level == rule_value.to_i && (Test.where(level: rule_value).pluck(:id) - @passed_tests_ids).empty?
      condition_passed_ids = TestPassage.where(user: @user, success: true, test: Test.where(level: rule_value)).pluck(:test_id).tally
      condition_passed_ids.values.each { |v| break false if v < condition_passed_ids[@test.id] }
    end
  end

  def check_attempt(rule_value)
    TestPassage.where(test_id: @test.id, user_id: @user.id).count == rule_value.to_i
  end

end