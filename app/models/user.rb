class User < ApplicationRecord

  def tests_by_level level
    Test.joins("JOIN results ON tests.id = results.test_id and results.user_id = #{self.id}").where(level: level).pluck(:title)
  end
end
