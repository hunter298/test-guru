class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user

  def self.sort_reverse(category)
    self.where(category: Category.find_by(title: category).id).order('title DESC').pluck(:title)
  end
end
