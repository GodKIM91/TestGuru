class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.by_category(category_name)
    joins(:category).where(categories: {title: category_name}).order(title: :desc).pluck(:title)
  end
end
