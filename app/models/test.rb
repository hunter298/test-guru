class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  def self.sort_reverse(category)
    Category.find_by(title: category).tests.order(title: :desc).pluck(:title)
  end
end
