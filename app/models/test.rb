class Test < ApplicationRecord
  belongs_to :category

  def self.sort_reverse(category)
    where(category_id: Category.find_by(title: category).id).order('title DESC').pluck(:title)
  end
end
