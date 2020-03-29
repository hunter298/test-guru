class User < ApplicationRecord

  def tests_by_level level
    tests = Result.where(user_id: self.id).pluck(:test_id).map do |num|
      Test.find(num).title if Test.find(num).level == level
    end
    tests.compact
  end
end
