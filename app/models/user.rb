class User < ApplicationRecord
  has_many :tests

  def tests_by_level(level)
    self.tests.where(level: level).pluck(:title)
  end
end
