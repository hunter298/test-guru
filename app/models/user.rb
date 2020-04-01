class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :test_creations, foreign_key: "creator_id"
  has_many :creations, through: :test_creations, class_name: "Test"

  def tests_by_level(level)
    Test.joins("JOIN results ON results.test_id = tests.id").where(results: {user_id: id}, level: level)
  end
end
