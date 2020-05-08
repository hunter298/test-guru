class Feedback
  include ActiveModel::Model

  attr_accessor :email, :feedback

  validates :email, :feedback, presence: true
  validates :email, format: Devise.email_regexp
end