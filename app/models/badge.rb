class Badge < ApplicationRecord

  has_and_belongs_to_many :users
  validates :name, :image, presence: true
  validate :validate_scope, on: :create

  # method return true if user passed all tests according to condition of badge, else - false
  def check_condition(test_passage)
    if exact_test
      test_id == test_passage.test.id && check_attempts(test_passage)
    else
      current_scope = matched_tests(user_success(test_passage))
      if current_scope.include?(test_passage.test)
        amount == current_scope.count && check_attempts(test_passage)
      end
    end
  end

  private

  # if badge relating only to exact test, no need to specify category or level
  def validate_scope
    if exact_test?
      errors.add(:test_id, :blank, message: 'Test not chosen') if test_id.nil?
    else
      errors.add(:base, :category_or_level_npt_chose, message: 'Scope not chosen') if category.nil? && level.nil?
    end
  end

  # quantity of tests needed to be passed successfully to receive badge
  def amount
    if quantity
      quantity
    else
      matched_tests(Test).count
    end
  end

  # method check how much tests from scope satisfy condition
  def matched_tests(scope)
    if category.nil?
      scope.where(level: level.split('').map { |level| level.to_i })
    elsif level.nil?
      scope.where(category_id: category.split('').map { |category| category.to_i })
    else
      scope.where(level: level.split('').map { |level| level.to_i }, category_id: category.split('').map { |category| category.to_i })
    end
  end

  public

  # method return Relation object with user`s successfully passed test
  def user_success(test_passage)
    if attempts.nil?
      Test.where(id: (test_passage.user.successful_test_passages.map { |passage| passage.test_id }))
    else
      Test.where(id: (test_passage.user.successful_test_passages.select { |passage| check_attempts(passage) }.map { |passage| passage.test_id }))
    end
  end

  def check_attempts(test_passage)
    if attempts.nil?
      true
    else
      test_passage.attempt <= attempts
    end
  end

end
