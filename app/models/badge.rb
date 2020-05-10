class Badge < ApplicationRecord

  has_and_belongs_to_many :users
  validates :name, :image, presence: true
  validate :validate_scope, on: :create

  def check_condition(test_passage)
    if test_passage.successful?
      if exact_test
        test_id == test_passage.test.id ? true : false
      else
        amount == matched_tests(user_success(test_passage)).count ? true : false
      end
    end

  end

  private

  def validate_scope
    if exact_test?
      errors.add(:test_id, :blank, message: 'Test not chosen') if test_id.nil?
    else
      errors.add(:base, :category_or_level_npt_chose, message: 'Scope not chosen') if category.nil? && level.nil?
    end
  end

  def amount
    if quantity
      quantity
    else
      matched_tests(Test).count
    end
  end

  def matched_tests(scope)
    if category.nil?
      scope.where(level: level.split('').map { |level| level.to_i })
    elsif level.nil?
      scope.where(category_id: category.split('').map { |category| category.to_i })
    else
      scope.where(level: level.split('').map { |level| level.to_i }, category_id: category.split('').map { |category| category.to_i })
    end
  end

  def user_success(test_passage)
    Test.where(id: (test_passage.user.successful_test_passages.map { |passage| passage.test_id }.uniq))
  end

end
