class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  validate :validate_answers_qty, on: :create
  scope :correct_answers, -> { where(correct: true) }

  private
  def validate_answers_qty
    errors.add(:question, :limit) if question.present? && question.answers.size >= 4
  end
end
