class Review < ApplicationRecord

  belongs_to :user
  belongs_to :restaurant

  has_many :reviewed_restaurants, through: :reviews, source: :restaurant

  validates :rating, inclusion: (1..5)

end
