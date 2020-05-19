class BadgeService

  RULES = %w[check_test check_category check_level check_attempt]

  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
    @success = test_passage.success
    @passed_tests = TestPassage.where(user: @user, success: true)
  end

  def badges
    (Badge.select { |badge| send(badge.rule, badge.rule_value) }) || []
  end

  # private

  def check_test(rule_value)
    (@test.title == rule_value) && @test_passage.successful?
  end

  # method check (1) last test_passage test category is match rule_value (2) all test of this category were passed earlier
  # (3) all test passed earlier were passed  not less times then last one
  def check_category(rule_value)
    tests = Test.where(category_id: rule_value)
    if (@test.category_id == rule_value.to_i) && (@test_passage.successful?)
      badge = Badge.where(rule: 'check_category', rule_value: rule_value).first
      if @user.badges.include?(badge)
        from_time = Achievment.where(badge: badge, user: @user).order(:created_at).last.created_at
        (tests.pluck(:id) - @passed_tests.where(created_at: (from_time..Time.current)).pluck(:test_id)).empty?
      else
        (tests.pluck(:id) - @passed_tests.pluck(:test_id)).empty?
      end
    end
  end

  # method check (1) last test_passage test level is match rule_value (2) all test of this level were passed earlier
  # (3) all test passed earlier were passed  not less times then last one
  def check_level(rule_value)
    tests = Test.where(level: rule_value)
    if (@test.level == rule_value.to_i) && @test_passage.successful?
      badge = Badge.where(rule: 'check_level', rule_value: rule_value).first
      if @user.badges.include?(badge)
        from_time = Achievment.where(badge: badge, user: @user).order(:created_at).last.created_at
        (tests.pluck(:id) - @passed_tests.where(created_at: (from_time..Time.current)).pluck(:test_id)).empty?
      else
        (tests.pluck(:id) - @passed_tests.pluck(:test_id)).empty?
      end
    end
  end

  def check_attempt(rule_value)
    if @test_passage.successful?
      TestPassage.where(test_id: @test.id, user_id: @user.id) == rule_value.to_i
    end
  end

end