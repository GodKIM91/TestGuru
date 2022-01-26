class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable
  
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  validates :email, presence: true
  validates :email, uniqueness: { message: 'already exists' },
                    format: { with: URI::MailTo::EMAIL_REGEXP,
                    message: "Wrong email format, use pattern 'sometext@mail.com'" }
  
  def sort_user_tests_by_level(level)
    self.tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
