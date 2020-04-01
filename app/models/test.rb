class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :results
  has_many :users, through: :results
  has_many :test_creations, foreign_key: "creation_id"
  has_many :creators, through: :test_creations, class_name: "User"

  def self.sort_reverse(category)
    joins("JOIN categories ON tests.category_id = categories.id").where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
