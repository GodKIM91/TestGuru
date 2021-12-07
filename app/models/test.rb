class Test < ApplicationRecord
  belongs_to :category
  
  def self.by_category(category_name)
    joins('JOIN categories on categories.id = tests.category_id')
      .where(categories: {title: category_name})
      .order(title: :desc)
      .pluck(:title)
  end
end
