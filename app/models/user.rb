class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users

  def sort_user_tests_by_level(level)
    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
      .where('tests.level = :level AND tests_users.user_id = :user_id', level: level, user_id: id)
  end
end
