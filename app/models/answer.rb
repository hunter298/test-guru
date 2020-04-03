class Answer < ApplicationRecord
  belongs_to :question
  scope :right, -> { where(correct: true) }
  validates :body, presence: true
  validate :validate_max_answers, on: :create
  # validate :validate_minimum_answers, on: :destroying???????
  #
  private

  def validate_max_answers
    if Question.find(question_id).answers.count >= 4
      errors.add(:question_id, 'Has too much answers')
    end
  end

  # def validate_minimum_answers
  #   if Question.find(question_id).answers.count >= 4
  #   errros.add(:question_id, message: 'Should have at least 1 answer')
  # end
end
