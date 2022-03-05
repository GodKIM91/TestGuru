class Badge < ApplicationRecord
  
  def self.rule
    %i[success_category success_on_first_try success_all_level]
  end

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :image, :rule, :parameter, :description, presence: true
end
