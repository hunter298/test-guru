class Badge < ApplicationRecord

  RULES = {'check_test' => I18n.translate('.exact_test'),
           'check_category' => I18n.translate('.exact_category'),
           'check_level' => I18n.translate('.exact_level'),
           'check_attempt' => I18n.translate('.exact_attempt')}

  has_and_belongs_to_many :users
  validates :name, :image, presence: true
  validates :rule, inclusion: { in: RULES }
  validates :rule, uniqueness: { scope: :rule_value }

end
