class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :creations, foreign_key: "creator_id", dependent: :destroy, class_name: "Test"
  validates :email, :username, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
