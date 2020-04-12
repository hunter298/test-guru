class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_save :before_save_next_question, unless: :new?

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def success_rate
    ((correct_questions.to_f / test.questions.count) * 100).round
  end

  def success_class
    success_rate >= 85 ?  'successfull' : 'unsuccessfull'
  end

  def question_count
    hash = {}
    test.questions.ids.each.with_index(1) { |id, index| hash[id] = index}
    "#{hash[current_question.id]} of #{test.questions.count}"
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.right
  end

  def before_save_next_question
    self.current_question = test.questions.order(:id).where('id > :current', current: current_question.id).first
  end

  def new?
    self.new_record?
  end


end
