class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def self.by_category(category_name)
    joins(:category).where(categories: {title: category_name}).order(title: :desc).pluck(:title)
  end
end
