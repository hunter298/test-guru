class Gist < ApplicationRecord
  belongs_to :user

  validates :gist_url, presence: true
end
