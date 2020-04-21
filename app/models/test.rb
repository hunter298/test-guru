class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :creator, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  validates :category_id, presence: true
  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: -1 }

  scope :difficulty, ->(hardness) {
    if hardness == :easy
      where(level: 0..1)
    elsif hardness == :medium
      where(level: 2..4)
    elsif hardness == :hard
      where(level: 5..Float::INFINITY)
    end
  }
  scope :sort_reverse, ->(category) { joins(:category).where(categories: { title: category }).order(title: :desc) }
end
