class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :book
  has_many :likes, dependent: :destroy
  validates :review,
    length: { minimum: 1, maximum: 150 }
end
