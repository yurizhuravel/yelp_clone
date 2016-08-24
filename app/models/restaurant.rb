class Restaurant < ApplicationRecord

  has_many :reviews, dependent: :destroy

  validates :name, length: { minimum: 2 }

end
