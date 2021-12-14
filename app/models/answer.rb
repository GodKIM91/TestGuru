class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  validate :validate_answers_qty, on: :create
  scope :return_correct, -> { where(correct: true) }

  private
  def validate_answers_qty
    errors.add(:question, 'Limit of answers') if question.answers.size >= 4
  end
end
