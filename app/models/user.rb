class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :creations, foreign_key: "creator_id", dependent: :destroy, class_name: "Test"
  validates :email, :username, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end
end
