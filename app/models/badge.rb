class Badge < ApplicationRecord

  has_many :achievments, dependent: :destroy
  has_many :users, through: :achievments
  validates :name, :image, presence: true
  validates :rule, inclusion: { in: BadgeService::RULES }
  validates :rule, uniqueness: { scope: :rule_value }

end
