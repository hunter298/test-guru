class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  scope :successful, -> { where(success: true) }
  before_validation :before_validation_set_current_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.success = true if successful?
    save!
  end

  def completed?
    current_question.nil?
  end

  def success_rate
    ((correct_questions.to_f / test.questions.count) * 100).round
  end

  def successful?
    success_rate >= 85
  end

  def question_count
    test.questions.order(:id).where('id <= :current', current: current_question.id).count
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def next_question
    if current_question.nil?
      test.questions.order(:id).first
    else
      test.questions.order(:id).where('id > :current', current: current_question.id).first
    end

  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

end
