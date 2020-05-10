class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :gists,  dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :creations, foreign_key: "creator_id", dependent: :destroy, class_name: "Test"
  has_and_belongs_to_many :badges

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    self.is_a?(Admin)
  end

  def full_name
    first_name.nil? ? email : first_name
  end
end
