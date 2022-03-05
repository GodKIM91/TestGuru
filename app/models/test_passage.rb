class TestPassage < ApplicationRecord

  PASSING_SCORE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: %i[create update]
  before_validation :add_result, on: :update

  scope :by_level, -> (level) { joins(:test).where(tests: { level: level }) }
  scope :passed, -> { where(passed: true) }

  def completed?
    current_question.nil?
  end

  def test_question_qty
    test.questions.count
  end

  def percent_correct
    (correct_questions.to_f * 100 / test_question_qty).round(2)
  end

  def success?
    percent_correct >= PASSING_SCORE
  end

  def current_question_position
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def progress_percent
    (((current_question_position - 1).to_f / test_question_qty) * 100).round(1)
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  private
  
  def before_validation_set_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids.present?
  end

  def correct_answers
    current_question.answers.correct_answers
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def add_result
    self.success? ? self.passed = true : self.passed = false
  end
end