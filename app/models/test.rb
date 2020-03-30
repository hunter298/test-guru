class Test < ApplicationRecord
  belongs_to :category

  def self.sort_reverse category
    Test.joins("JOIN categories ON tests.category_id = categories.id and categories.title = '#{category}'").order(title: :desc).pluck(:title)
  end
end