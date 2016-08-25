class Restaurant < ApplicationRecord

  has_many :reviews,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy

  belongs_to :user

  validates :name, length: { minimum: 2 }, uniqueness: true

end
